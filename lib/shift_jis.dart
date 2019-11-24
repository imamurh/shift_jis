import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

class ShiftJis {
  static const MethodChannel _channel = const MethodChannel('shift_jis');

  static Future<Uint8List> encode(String string) async {
    final Uint8List encoded = await _channel.invokeMethod('encode', string);
    return encoded;
  }

  static Future<String> decode(Uint8List bytes) async {
    final String decoded = await _channel.invokeMethod('decode', bytes);
    return decoded;
  }
}
