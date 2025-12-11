import 'package:protobuf/protobuf.dart';
import 'package:flutter_trader/network/pb/comm.pb.dart' as comm;

class DispatchedMessage {
  final String msgName;
  final String servicePath;
  final GeneratedMessage payload;
  final String sec;
  DispatchedMessage({
    required this.msgName,
    required this.servicePath,
    required this.payload,
    required this.sec,
  });
}

class MessageDispatcher {
  final Map<String, GeneratedMessage Function()> registry;
  MessageDispatcher(this.registry);

  comm.MessagePackage decodePackage(List<int> bytes) {
    return comm.MessagePackage.fromBuffer(bytes);
  }

  List<DispatchedMessage> toMessages(comm.MessagePackage pkg) {
    final out = <DispatchedMessage>[];
    for (final s in pkg.messages) {
      final factory = registry[s.msgName];
      if (factory == null) continue;
      final msg = factory();
      msg.mergeFromBuffer(s.data.value);
      out.add(
        DispatchedMessage(
          msgName: s.msgName,
          servicePath: s.servicePath,
          payload: msg,
          sec: s.sec,
        ),
      );
    }
    return out;
  }
}
