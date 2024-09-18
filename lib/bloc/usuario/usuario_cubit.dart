import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_singleton_states/models/usuario.dart';

part "usuario_state.dart";

class UsuarioCubit extends Cubit<UsuarioState>{
  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario user){
    emit(UsuarioActivo(usuario: user));
  }

  void cambiarEdad(int edad){
    final currentState = state;

    if(currentState is UsuarioActivo){
      final newUser = currentState.usuario.copyUser(edad: edad);
      emit(UsuarioActivo(usuario: newUser));
    }
  }

  void agregarProfesion(){
    final currentState = state;

    if(currentState is UsuarioActivo){
      final newProfeciones = [
        ...currentState.usuario.profesiones!,
        'Profesion ${currentState.usuario.profesiones!.length + 1}'
      ];

      final newUser = currentState.usuario.copyUser(profesiones: newProfeciones);
      emit(UsuarioActivo(usuario: newUser));
    }
  }

  void borrarUsuario(){
    emit(UsuarioInitial());
  }
}