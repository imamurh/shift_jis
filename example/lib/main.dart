import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shift_jis/shift_jis.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _input = 'こんにちは〜';
  Uint8List _encoded;
  String _decoded;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    Uint8List encoded;
    String decoded;
    try {
      encoded = await ShiftJis.encode(_input);
      print(encoded);
      decoded = await ShiftJis.decode(encoded);
      print(decoded);
    } on PlatformException catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      _encoded = encoded;
      _decoded = decoded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shift_JIS Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_input\n'),
              Text('       ↓ encode\n'),
              Text('$_encoded\n'),
              Text('       ↓ decode\n'),
              Text('$_decoded\n'),
            ],
          ),
        ),
      ),
    );
  }
}
