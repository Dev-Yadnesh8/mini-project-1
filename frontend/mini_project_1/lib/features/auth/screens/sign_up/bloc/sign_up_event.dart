part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}
sealed class SignUpActionEvent extends SignUpEvent{}

class SignUpButtonClickedEvent extends SignUpEvent{
  final Map<String,dynamic> userData;

  SignUpButtonClickedEvent({required this.userData});
}
class BackButtonClickedEvent extends SignUpActionEvent{}