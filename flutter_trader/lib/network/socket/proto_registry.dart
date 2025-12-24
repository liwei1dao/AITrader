import 'package:protobuf/protobuf.dart';
import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart'
    as gp_any;
import 'socket_service.dart';
import 'package:flutter_trader/network/pb/gateway/gateway_msg.pb.dart' as gw;
import 'package:flutter_trader/network/pb/user/user_msg.pb.dart' as upb;
import 'package:flutter_trader/network/pb/news/news_msg.pb.dart' as nmsg;

class DefaultMessageResolver implements MessageResolver {
  final Map<String, GeneratedMessage Function()> _byTypeUrl = {};
  final Map<String, GeneratedMessage Function()> _byMsgName = {};

  @override
  GeneratedMessage? createByTypeUrl(String typeUrl) =>
      _byTypeUrl[typeUrl]?.call();

  @override
  GeneratedMessage? createByMsgName(String msgName) =>
      _byMsgName[msgName]?.call();

  void registerByTypeUrl(String typeUrl, GeneratedMessage Function() factory) {
    _byTypeUrl[typeUrl] = factory;
  }

  void registerByMsgName(String msgName, GeneratedMessage Function() factory) {
    _byMsgName[msgName] = factory;
  }

  void registerByMessage(GeneratedMessage instance, {String? msgName}) {
    GeneratedMessage factory() {
      final created = instance.info_.createEmptyInstance?.call();
      return (created is GeneratedMessage) ? created : instance.deepCopy();
    }

    final typeUrl = gp_any.Any.pack(instance).typeUrl;
    _byTypeUrl[typeUrl] = factory;
    if (msgName != null) {
      _byMsgName[msgName] = factory;
    }
  }
}

void installDefaultProtoRegistry(SocketService service) {
  final resolver = DefaultMessageResolver();
  resolver.registerByMessage(
    gw.GatewayHeartbeatResp(),
    msgName: 'gateway.heartbeat',
  );
  resolver.registerByMessage(
    gw.GatewayErrorNotifyPush(),
    msgName: 'gateway.errornotify',
  );
  resolver.registerByMessage(upb.UserSginResp(), msgName: 'user.sgin');
  resolver.registerByMessage(
    upb.UserGetStocksResp(),
    msgName: 'user.getstocks',
  );
  resolver.registerByMessage(upb.UserAddStockResp(), msgName: 'user.addstock');
  resolver.registerByMessage(
    nmsg.NewsGetRealTimeGlobalNewsResp(),
    msgName: 'news.getrealtimeglobalnews',
  );
  service.setResolver(resolver);
}
