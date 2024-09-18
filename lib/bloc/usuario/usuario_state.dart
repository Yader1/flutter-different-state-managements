// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'usuario_cubit.dart';

@immutable
abstract class UsuarioState {

}

class UsuarioInitial extends UsuarioState{
  final existeUsuario = false;
}

class UsuarioActivo extends UsuarioState {
  final existeUsuario = true;
  final Usuario usuario;
  
  UsuarioActivo({
    required this.usuario,
  });
}
