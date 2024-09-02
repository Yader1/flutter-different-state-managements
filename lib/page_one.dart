import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_singleton_states/models/usuario.dart';
import 'package:flutter_singleton_states/service/usuario_service.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: (){
              usuarioService.removerUsuario();
            }, 
            icon: const Icon(Icons.delete_outline, color: Colors.white)
          )
        ],
      ),
      body: usuarioService.existeUsuario 
        ? InformacionUsuario(usuario: usuarioService.usuario)
        : const Center(child: Text("No hay usuario seleccionado.")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pageTwo'),
        child: const Icon(Icons.ads_click_outlined),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  
  const InformacionUsuario({
    super.key,
    required this.usuario,
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
          ...usuario.profesiones!.map(
            (profecion) => ListTile(title: Text(profecion))
          ).toList()
        ],
      ),
    );
  }
}
