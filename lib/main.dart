import 'package:flutter/material.dart';
import 'login.dart';
import 'read.dart';
import 'detail.dart';
import 'edit.dart';
import 'add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/add': (context) =>AddData(),
        '/read': (context) =>Read(),
        '/detail': (context) =>Detail(),
        '/edit': (context) =>Edit(),
      },
    );
  }
}