import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_singleton_states/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_singleton_states/models/usuario.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            onPressed: (){
              context.read<UsuarioCubit>().borrarUsuario();
            }, 
            icon: const Icon(Icons.exit_to_app)
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pageTwo'),
        child: const Icon(Icons.ads_click_outlined),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state){
        switch(state.runtimeType){
          case UsuarioInitial:
            return const Center(child: Text('No hay informacion'));
          break;

          case UsuarioActivo:
            return InformacionUsuario(usuario: (state as UsuarioActivo).usuario);
          break;

          default:
            return const CircularProgressIndicator();
        }
        /*if(state is UsuarioInitial){
          return const Center(child: Text('No hay informacion'));
        } else if(state is UsuarioActivo){
          return InformacionUsuario(usuario: state.usuario);
        } else {
          return const CircularProgressIndicator();
        }*/
      } 
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  
  const InformacionUsuario({
    super.key, required this.usuario,
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
            (profesion) => ListTile(
              title: Text(profesion),
            )
          ).toList()
        ],
      ),
    );
  }
}