part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable{
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState{
  const LoginLoading();
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState{
  final String message;
 const LoginFailed({required this.message});
  @override
  List<Object> get props => [message];
}


class LoginSuccess extends LoginState{
  final String message;
 const LoginSuccess({required this.message,});
  @override
  List<Object> get props => [message];
}