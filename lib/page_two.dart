import 'package:flutter/material.dart';
import 'package:flutter_singleton_states/controllers/usuario_controller.dart';
import 'package:flutter_singleton_states/models/usuario.dart';
import 'package:get/get.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.find<UsuarioController>();

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
                usuarioCtrl.cargarUsuario(Usuario(nombre: 'Yader', edad: 24));
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                usuarioCtrl.cambiarEdad(24);
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                usuarioCtrl.agregarProfesion("Profesion #${usuarioCtrl.profesionesCout + 1}");
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