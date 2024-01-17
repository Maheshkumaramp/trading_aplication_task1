import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:trading_app/dao/login_dao.dart';
import 'package:trading_app/helpers/customlog.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginDao loginDao;
  LoginBloc() : super(LoginInitial()) {
    loginDao =LoginDao();
    on<LoginWithEmailEvent>((event, emit) async{
      await mapLoginWithEmailEvent(event, emit);
    });
  }

  Future<void> mapLoginWithEmailEvent(
      LoginWithEmailEvent event, Emitter<LoginState> emit) async {
    try{
      customLog("------------------1--------------------");
      emit(const LoginLoading());

      customLog("------------------2--------------------");
      var response = await loginDao.login(email: event.email,password: event.password);

      customLog("------------------3--------------------");

      Map<String,dynamic> jsonDecoded = jsonDecode(response.body);
      if(response.statusCode == 200){


        emit(const LoginSuccess(message:"Login Successfull" ));

        customLog("--------Login 4---------------");

      }
      else{

        String message = jsonDecoded["error"];
        customLog("The failure reason: $message");
        customLog("Something went wrong");
        emit( LoginFailed(message: message));
      }

    }catch(error){
      customLog("The error of login : $error");
      emit(const LoginFailed(message: "Something went wrong"));
    }
  }
}
