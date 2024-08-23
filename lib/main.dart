import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Proyecto 1',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: CupertinoColors.systemGreen,
        ),
        body: Container(
          color: Colors.greenAccent,
          width: MediaQuery.of(context).size.width,
          child: const Text('Hola Mundo'),
        ),
      ),
    );
  }
}
