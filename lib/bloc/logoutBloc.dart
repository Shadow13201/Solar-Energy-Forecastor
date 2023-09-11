import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/LogoutModel.dart';
import '../data/repository.dart';
import '../helper/sharedpreferences.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutBloc() : super(LogOutState()) {

    on<CheckLOGOUT>(_checkLogout);

    on<CheckAuth>(_checkAuth);
  }

  Future<FutureOr<void>> _checkLogout(
      CheckLOGOUT event, Emitter<LogOutState> emit) async {
    emit(CheckingLogout());
    LogoutModel logoutModel;



    logoutModel =
    await Repository().logout(url: '/logout/admin', );
    if (logoutModel.status == true) {
      await TempStorage.removeToken();


      emit(LogoutChecked());
    } else {
      emit(LogoutError(error: logoutModel.msg.toString()));
    }
  }



  Future<FutureOr<void>> _checkAuth(CheckAuth event, Emitter<LogOutState> emit) async {
    var token = await TempStorage.getToken();
    var role = await TempStorage.getRole();
    if (token != null) {
      emit(AuthConfirmed(role: role));

    } else if (token == null) {
      emit(AuthNotConfirmed());
    }
  }
}
//events
class LogOutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckLOGOUT extends LogOutEvent {

}

class CheckAuth extends LogOutEvent {

}


//states

class LogOutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingLogout extends LogOutState {}
class LogoutChecked extends LogOutState {}

class LogoutError extends LogOutState {
  final String error;
  LogoutError({required this.error});
}
class AuthNotConfirmed extends LogOutState {}

class AuthConfirmed extends LogOutState {
  final String role;
  AuthConfirmed({required this.role});
}