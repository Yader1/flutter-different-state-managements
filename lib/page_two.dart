import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_singleton_states/bloc/user/user_bloc.dart';
import 'package:flutter_singleton_states/models/usuario.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);

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
                final newUser = Usuario(nombre: 'Yader', edad: 23, profesiones: ['Stack', 'Flutter']);
                userBloc.add(ActivateUser(newUser));
              },
              color: Colors.blue,
              child: const Text('Establecer Usuario', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                userBloc.add(ChangeUserAge(age: 24));
              },
              color: Colors.blue,
              child: const Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            ),

            MaterialButton(
              onPressed: (){
                userBloc.add(AddProfesion(profesion: "Nueva profesion"));
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