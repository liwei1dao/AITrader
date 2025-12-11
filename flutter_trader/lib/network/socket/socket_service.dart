import 'dart:async';
import 'package:get/get.dart';
import 'package:protobuf/protobuf.dart';
import 'proto_codec.dart';
import 'websocket_client.dart';
import 'message_dispatcher.dart';

class SocketService extends GetxService {
  WebSocketClient? _client;
  final status = ConnectionStatus.disconnected.obs;
  final _messagesController = StreamController<dynamic>.broadcast();
  final _errorsController = StreamController<Object>.broadcast();
  StreamSubscription? _statusSub;
  StreamSubscription? _msgSub;
  StreamSubscription? _errSub;

  Stream<dynamic> get messages => _messagesController.stream;
  Stream<Object> get errors => _errorsController.stream;

  Future<void> connect({
    required Uri uri,
    required ProtobufCodec codec,
    Iterable<String>? protocols,
    Duration? pingInterval,
    List<int>? pingData,
    MessageDispatcher? dispatcher,
  }) async {
    _client?.dispose();
    _client = WebSocketClient(
      uri: uri,
      codec: codec,
      protocols: protocols,
      pingInterval: pingInterval,
      pingData: pingData,
    );

    _statusSub?.cancel();
    _msgSub?.cancel();
    _errSub?.cancel();

    _statusSub = _client!.status.listen((s) => status.value = s);
    if (dispatcher == null) {
      _msgSub = _client!.messages.listen(_messagesController.add);
    } else {
      _msgSub = _client!.bytes.listen((data) {
        final pkg = dispatcher.decodePackage(data);
        for (final m in dispatcher.toMessages(pkg)) {
          _messagesController.add(m);
        }
      });
    }
    _errSub = _client!.errors.listen(_errorsController.add);

    await _client!.connect();
  }

  void disconnect() {
    _client?.disconnect();
  }

  void sendMessage(GeneratedMessage message) {
    _client?.sendMessage(message);
  }

  void sendBytes(List<int> data) {
    _client?.sendBytes(data);
  }

  @override
  void onClose() {
    _statusSub?.cancel();
    _msgSub?.cancel();
    _errSub?.cancel();
    _client?.dispose();
    _messagesController.close();
    _errorsController.close();
    super.onClose();
  }
}
