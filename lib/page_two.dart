import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_singleton_states/models/usuario.dart';
import 'package:flutter_singleton_states/service/usuario_service.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text(usuarioService.usuario.nombre)
          : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                final newUser = Usuario(
                  nombre: "Yader", 
                  edad: 24,
                  profesiones: [
                    'Dev Flutter',
                    'Dev Kotlin'
                  ]
                );
                usuarioService.usuario = newUser;
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                usuarioService.cambiarEdad(25);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                usuarioService.agregarProfesion();
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