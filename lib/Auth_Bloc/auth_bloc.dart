
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_application/repository/repository_register.dart';

import '../modelclass/regioster_model.dart';
import 'auth_event.dart';
import 'auth_state.dart';



class AuthBloc extends Bloc<AuthEvent, AuthState> {
   RegisterModelClass? data;
  final RegisterRepo registerrepo;
AuthBloc(this.registerrepo):super(AuthStateIntial()){
on<AuthEvent>((event, emit) async{

  if(event is Register){
    emit(AuthStateLoading());
    await Future.delayed(const Duration(seconds: 3),()async{
      data = await registerrepo.RegisterApi(event.username,event.nickname , event.phone, event.email,event.password, event.confirmpassword);
      emit(AuthStateSuccess(data!));
    });
  }

});
}
}
