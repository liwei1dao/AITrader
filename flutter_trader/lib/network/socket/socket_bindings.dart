import 'package:get/get.dart';
import 'socket_service.dart';
import 'message_dispatcher.dart';
import 'proto_codec.dart';
import 'package:flutter_trader/core/config/env.dart';
import 'proto_registry.dart';

class SocketBindings implements Bindings {
  @override
  void dependencies() {
    final service = Get.put(SocketService(), permanent: true);
    final url = Env.get('WS_URL');
    if (url != null && url.isNotEmpty) {
      installDefaultProtoRegistry(service);
      service.connect(
        uri: Uri.parse(url),
        codec: TypeRegistryCodec({}),
        dispatcher: const MessageDispatcher(),
      );
    }
  }
}
