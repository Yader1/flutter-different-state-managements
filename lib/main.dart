import 'package:flutter/material.dart';

import 'page_one.dart';
import 'page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'pageOne',
      routes: {
        'pageOne': (_) => const PageOne(),
        'pageTwo': (_) => const PageTwo()
      },
    );
  }
}