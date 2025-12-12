import 'package:flutter_trader/network/pb/comm.pb.dart' as comm;

class MessageDispatcher {
  const MessageDispatcher();

  comm.MessagePackage decodePackage(List<int> bytes) {
    return comm.MessagePackage.fromBuffer(bytes);
  }

  List<comm.SocketMessage> toSocketMessages(comm.MessagePackage pkg) {
    return pkg.messages;
  }
}
