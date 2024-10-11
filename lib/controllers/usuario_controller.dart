import 'package:get/get.dart';
import '../models/usuario.dart';

class UsuarioController extends GetxController{
  var existeUsuario = false.obs;
  var usuario = Usuario().obs;

  int get profesionesCout{
    return usuario.value.profesiones!.length;
  }

  void cargarUsuario(Usuario pUsuario){
    existeUsuario.value = true;
    usuario.value = pUsuario;
  }

  void cambiarEdad(int edad){
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion(String prof){
     usuario.update((val) {
      val!.profesiones = [...val.profesiones!, prof];
    });
  }
}