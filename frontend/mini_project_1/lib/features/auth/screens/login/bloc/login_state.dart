part of 'login_bloc.dart';

@immutable
sealed class LoginState {}
sealed class LoginActionState extends LoginState{}

final class LoginInitialState extends LoginState {}
final class LoginLoadingState extends LoginState {}
final class LoginLoadedState extends LoginActionState {}
final class LoginErrorState extends LoginActionState {
  final String errorTitle;
  final String errorDesc;
  LoginErrorState({required this.errorTitle,required this.errorDesc});
}

final class CreateOneButtonClickActionState extends LoginActionState{}