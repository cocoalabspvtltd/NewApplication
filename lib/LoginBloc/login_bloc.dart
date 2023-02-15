import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:new_application/repository/repository_register.dart';

import '../modelclass/regioster_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  RegisterModelClass? data;
  final RegisterRepo registerrepo;
  LoginBloc(this.registerrepo):super(LoginStateIntial()){
    on<LoginEvent>((event, emit) async{

      if(event is Login){
        emit(LoginStateLoading());
        await Future.delayed(const Duration(seconds: 3),()async{
          data = await registerrepo.LoginApi(event.Email,event.password, );
          emit(LoginStateSuccess(data!));
        });
      }

    });
  }
}
