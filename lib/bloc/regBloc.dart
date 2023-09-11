import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/regModel.dart';
import '../data/repository.dart';
class RegBloc extends Bloc<RegEvent, RegState> {
  RegBloc() : super(RegState()) {

    on<CheckReg>(_CheckReg);
  }



  Future<FutureOr<void>> _CheckReg(
      CheckReg event, Emitter<RegState> emit) async {
    emit(CheckingReg());
    RegModel regModel;

    Map data = {
      "name": event.name,
      "phonenumber":event.phone,
      "city":event.city,
      "email":event.email,
      "password":event.password,
      "gender":event.gender,

    };
    regModel = await Repository().registration(url: '/reg/user', data: data);
    if (regModel.status == true) {
      emit(RegChecked(regModel));
    } else {
      emit(RegError(error: regModel.msg.toString()));
    }
  }
}
//events
class RegEvent extends Equatable {
  @override
  List<Object?> get props => [];
}



class CheckReg extends RegEvent {
  final String  phone,name,city,password,email,gender;
  CheckReg({required this.name,required this.phone,required this.city,
    required this.email,required this.password,required this.gender
  });
}
class ShowProfile extends RegEvent{}


//states

class RegState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckingReg extends RegState {}
class RegChecked extends RegState {
  final RegModel regModel;
  RegChecked(this.regModel);
}

class RegError extends RegState {
  final String error;
  RegError({required this.error});
}