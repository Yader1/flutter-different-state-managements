import 'dart:async';

import 'package:flutter_singleton_states/models/usuario.dart';

class _UsuarioService {
  Usuario? _usuario;

  final StreamController<Usuario> _usuarioStremController = StreamController.broadcast();

  Usuario get usuario => _usuario!;
  bool get existeUsuario => (_usuario != null) ? true : false;
  Stream<Usuario> get usuarioStream => _usuarioStremController.stream;

  void cargarUsuario(Usuario user){
    _usuario = user;
    _usuarioStremController.add(user);
  }

  void cambiarEdad(int edad){
    _usuario!.edad = edad;
    _usuarioStremController.add(_usuario!);
  }

  dispose(){
    _usuarioStremController.close();
  }
}

final usuarioService = _UsuarioService();