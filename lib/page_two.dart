import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_singleton_states/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_singleton_states/models/usuario.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    var usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                final newUser = Usuario(
                  nombre: 'Yader', 
                  edad: 23,
                  profesiones: [
                    'Dev Kotlin',
                    'Dev Flutter'
                  ]
                );

                usuarioCubit.seleccionarUsuario(newUser);
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                usuarioCubit.cambiarEdad(30);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                usuarioCubit.agregarProfesion();
              },
              color: Colors.blue,
              child: const Text('Anadir Profesion', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}