# shift_jis

Flutter plugin for Shift_JIS encoding and decoding, using platform channels.

## Usage

```dart
import 'package:shift_jis/shift_jis.dart';
```

Encode:

```dart
Future<Uint8List> shiftJisEncode(String text) async {
  final encoded = await ShiftJis.encode(text);
  return encoded;
}
```

Decode:

```dart
Future<String> shiftJisDecode(Uint8List encoded) async {
  final decoded = await ShiftJis.decode(encoded);
  return decoded;
}
```