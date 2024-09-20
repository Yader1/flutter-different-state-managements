part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUser extends UserEvent{
  final Usuario? user;

  ActivateUser(Usuario newUser, {this.user});
}

class ChangeUserAge extends UserEvent {
  final int age;

  ChangeUserAge({required this.age});
}

class AddProfesion extends UserEvent {
  final String profesion;

  AddProfesion({required this.profesion});
}

class DeleteUser extends UserEvent{}