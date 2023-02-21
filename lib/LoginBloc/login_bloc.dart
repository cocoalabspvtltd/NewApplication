// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:new_application/modelclass/user_signin_model.dart';
// import 'package:new_application/repository/commoninfo_repository.dart';
//
// import '../modelclass/regioster_model.dart';
//
// part 'login_event.dart';
// part 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   UserSignInDetails? data;
//   final AuthRegisterRepo registerrepo;
//   LoginBloc(this.registerrepo):super(LoginStateIntial()){
//     on<LoginEvent>((event, emit) async{
//
//       if(event is Login){
//         emit(LoginStateLoading());
//         await Future.delayed(const Duration(seconds: 3),()async{
//          // data = await registerrepo.l(event.Email,event.password, );
//           emit(LoginStateSuccess(data!));
//         });
//       }
//
//     });
//   }
// }
