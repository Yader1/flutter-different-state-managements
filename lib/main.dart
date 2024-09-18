import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_singleton_states/bloc/usuario/usuario_cubit.dart';

import 'page_one.dart';
import 'page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioCubit())
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