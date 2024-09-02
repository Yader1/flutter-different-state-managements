import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'page_one.dart';
import 'page_two.dart';
import 'service/usuario_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UsuarioService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pageOne',
        routes: {
          'pageOne': (_) => const PageOne(),
          'pageTwo': (_) => const PageTwo()
        },
      ),
    );
  }
}