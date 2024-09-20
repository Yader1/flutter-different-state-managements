import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_singleton_states/models/usuario.dart';

import '../bloc/user/user_bloc.dart';

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
              BlocProvider.of<UserBloc>(context, listen: false).add(DeleteUser());
            }, 
            icon: const Icon(Icons.delete_outline)
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state){
          return state.existUser 
            ? InformacionUsuario(user: state.user!)
            : const Center(child: Text('No hay usuario.'));
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pageTwo'),
        child: const Icon(Icons.ads_click_outlined),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;

  const InformacionUsuario({
    super.key, 
    required this.user,
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
            title: Text('Nombre: ${user.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${user.edad}'),
          ),

          const Text('Profeciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...user.profesiones!.map((prof) => ListTile(
            title: Text(prof),
          )).toList()
        ],
      ),
    );
  }
}