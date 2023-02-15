

import 'package:flutter/cupertino.dart';
import 'package:new_application/modelclass/regioster_model.dart';

@immutable
 class AuthState {

  // AuthState( {required this.username,required this.email,required this.password});
}
class AuthStateIntial extends AuthState{

}
class AuthStateLoading extends AuthState{

}
class AuthStateSuccess extends AuthState{
  late final RegisterModelClass data;
  AuthStateSuccess(this.data);
}

class AuthStateError extends AuthState{

}