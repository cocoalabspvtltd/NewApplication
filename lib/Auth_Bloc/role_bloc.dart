// import 'dart:async';
//
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:new_application/Auth_Bloc/role_bloc.dart';
// import 'package:new_application/Auth_Bloc/role_bloc.dart';
// import 'package:new_application/Auth_Bloc/role_bloc.dart';
// import 'package:new_application/modelclass/login_modelclass.dart';
// import 'package:new_application/modelclass/user_signin_model.dart';
// import 'package:new_application/repository/commoninfo_repository.dart';
//
// part 'role_event.dart';
// part 'role_state.dart';
//
// class RoleBloc extends Bloc<RoleEvent, RoleState> {
//   RoleModel? data;
//   late final AuthRegisterRepo registerrepo;
//
//   RoleBloc(this.registerrepo):super(RoleInitial()){
//     on<RoleEvent>((event, emit) async{
//
//       if(event is Role){
//         emit(RoleStateLoading());
//         await Future.delayed(const Duration(seconds: 3),()async{
//           data = await registerrepo.Role(event.restaurentname,event.restaurentnum ,event.restauretaddress,event.type);
//           emit(RoleStateSuccess(data!));
//         });
//
//       }
//     });
//   }
// }
//
