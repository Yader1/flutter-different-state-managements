import 'package:flutter/material.dart';
import 'package:flutter_singleton_states/controllers/usuario_controller.dart';
import 'package:flutter_singleton_states/models/usuario.dart';
import 'package:get/get.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCtrl = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Obx(
        () => usuarioCtrl.existeUsuario.value
          ? InformacionUsuario(usuario: usuarioCtrl.usuario.value)
          : const NoData()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('pageTwo', arguments: {'nombre': 'Yader', 'edad': 35}),
        //Navigator.pushNamed(context, 'pageTwo'),
        child: const Icon(Icons.ads_click_outlined),
      ),
    );
  }
}

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No hay usuario"));
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    super.key,
    required this.usuario
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),

          const Text('Profeciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones!.map((prof) => ListTile(
            title: Text(prof),
          ))
        ],
      ),
    );
  }
}