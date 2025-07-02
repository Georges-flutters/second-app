import 'package:flutter/material.dart';
import 'package:flutter_application/First-Page.dart';
import 'package:flutter_application/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Providers(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: FirstPage()),
    );
  }
}
