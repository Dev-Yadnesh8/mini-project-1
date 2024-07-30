part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}
sealed class LoginActionEvent extends LoginEvent{}

 class LoginButtonClickedEvent  extends LoginEvent {
  final Map<String,dynamic> userCred;

  LoginButtonClickedEvent({required this.userCred});
}

class CreateOneButtonClickActionEvent extends LoginActionEvent {}
