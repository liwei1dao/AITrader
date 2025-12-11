import 'package:get/get.dart';
import 'socket_service.dart';
import 'message_dispatcher.dart';
import 'proto_codec.dart';
import 'package:flutter_trader/core/config/env.dart';
import 'package:flutter_trader/network/pb/market/market_msg.pb.dart' as market;
import 'package:flutter_trader/network/pb/stock/stock_db.pb.dart' as stock;

class SocketBindings implements Bindings {
  @override
  void dependencies() {
    final service = Get.put(SocketService(), permanent: true);
    final url = Env.get('WS_URL');
    if (url != null && url.isNotEmpty) {
      final dispatcher = MessageDispatcher({
        'MarketRealtimeInfoReq': () => market.MarketRealtimeInfoReq(),
        'MarketRealtimeInfoResp': () => market.MarketRealtimeInfoResp(),
        // Stock database messages (examples)
        'DBStockIdentity': () => stock.DBStockIdentity(),
        'DBStockBar': () => stock.DBStockBar(),
        'DBFundamentalSnapshot': () => stock.DBFundamentalSnapshot(),
        'DBStockNews': () => stock.DBStockNews(),
        'DBStockReport': () => stock.DBStockReport(),
      });
      service.connect(
        uri: Uri.parse(url),
        codec: TypeRegistryCodec({}),
        pingInterval: const Duration(seconds: 30),
        pingData: const [0],
        dispatcher: dispatcher,
      );
    }
  }
}
