import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/LogoutModel.dart';
import '../data/repository.dart';
import '../helper/sharedpreferences.dart';

class LogOutUserBloc extends Bloc<LogOutUserEvent, LogOutUserState> {
  LogOutUserBloc() : super(LogOutUserState()) {

    on<CheckLOGOUTUser>(_checkLogoutUser);

    on<CheckAuth>(_checkAuth);
  }

  Future<FutureOr<void>> _checkLogoutUser(
      CheckLOGOUTUser event, Emitter<LogOutUserState> emit) async {
    emit(CheckingLogoutUser());
    LogoutModel logoutModel;



    logoutModel =
    await Repository().logout(url: '/logout/user', );
    if (logoutModel.status == true) {
      await TempStorage.removeToken();


      emit(LogoutUserChecked());
    } else {
      emit(LogoutUserError(error: logoutModel.msg.toString()));
    }
  }



  Future<FutureOr<void>> _checkAuth(CheckAuth event, Emitter<LogOutUserState> emit) async {
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
class LogOutUserEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckLOGOUTUser extends LogOutUserEvent {

}

class CheckAuth extends LogOutUserEvent {

}


//states

class LogOutUserState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingLogoutUser extends LogOutUserState {}
class LogoutUserChecked extends LogOutUserState {}

class LogoutUserError extends LogOutUserState {
  final String error;
  LogoutUserError({required this.error});
}
class AuthNotConfirmed extends LogOutUserState {}

class AuthConfirmed extends LogOutUserState {
  final String role;
  AuthConfirmed({required this.role});
}