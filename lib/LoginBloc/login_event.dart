part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class Login extends LoginEvent{

  late final String Email;
  late final String password;



  Login(this.Email,this.password,);}