import 'dart:typed_data';
import 'package:protobuf/protobuf.dart';

abstract class ProtobufCodec {
  List<int> encode(GeneratedMessage message);
  GeneratedMessage? decode(List<int> bytes);
}

class TypeRegistryCodec implements ProtobufCodec {
  final Map<int, GeneratedMessage Function()> registry;
  TypeRegistryCodec(this.registry);

  @override
  List<int> encode(GeneratedMessage message) {
    final typeId = _typeIdFor(message);
    final payload = message.writeToBuffer();
    final out = Uint8List(4 + payload.length);
    final bd = ByteData.sublistView(out);
    bd.setUint32(0, typeId, Endian.big);
    out.setRange(4, 4 + payload.length, payload);
    return out;
  }

  @override
  GeneratedMessage? decode(List<int> bytes) {
    if (bytes.length < 4) return null;
    final bd = ByteData.sublistView(Uint8List.fromList(bytes));
    final typeId = bd.getUint32(0, Endian.big);
    final factory = registry[typeId];
    if (factory == null) return null;
    final msg = factory();
    msg.mergeFromBuffer(bytes.sublist(4));
    return msg;
  }

  int _typeIdFor(GeneratedMessage msg) {
    for (final entry in registry.entries) {
      final probe = entry.value();
      if (probe.runtimeType == msg.runtimeType) return entry.key;
    }
    throw StateError('Unknown message type');
  }
}
