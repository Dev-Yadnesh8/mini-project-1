part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}
sealed class SignUpActionState extends SignUpState {}

final class SignUpInitialState extends SignUpState {}
final class SignUpLoadingState extends SignUpState {}
final class SignUpLoadedState extends SignUpActionState {}
final class SignUpErrorState extends SignUpActionState {
  final String errorTitle;
  final String errorDesc;

  SignUpErrorState({required this.errorTitle, required this.errorDesc});
}

final class BackButtonClickedActionState extends SignUpActionState{}