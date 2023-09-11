import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/LoginModel.dart';
import '../data/repository.dart';
import '../helper/sharedpreferences.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {

    on<CheckOTP>(_checkOtp);
  }

  Future<FutureOr<void>> _checkOtp(
      CheckOTP event, Emitter<AuthState> emit) async {
    emit(CheckingOtp());
    LoginModel loginModel;
    Map data = {
      "email": event.email,
      "password": event.password,
    };
    print(event.email);


    loginModel =
    await Repository().login(url: '/login/user', data: data);
    if (loginModel.status == true) {
      await TempStorage.addToken(loginModel.token.toString());
      await TempStorage.addRole(loginModel.role.toString());


      emit(OtpChecked(role:loginModel.user!.role!));
    } else {
      emit(OtpError(error: loginModel.msg.toString()));
    }
  }
}
//events
class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckOTP extends AuthEvent {
  final String  email,password;
  CheckOTP({ required this.email,required this.password});
}


//states

class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingOtp extends AuthState {}
class OtpChecked extends AuthState {
  final String role;
  OtpChecked({required this.role});
}

class OtpError extends AuthState {
  final String error;
  OtpError({required this.error});
}