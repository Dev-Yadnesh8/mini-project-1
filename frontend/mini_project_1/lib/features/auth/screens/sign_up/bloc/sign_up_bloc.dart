import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_project_1/utils/helpers/network/api_helper.dart';

import '../repo/sign_up_repo.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
 final SignUpRepo _repo ;
  SignUpBloc(this._repo) : super(SignUpInitialState()) {
   on<BackButtonClickedEvent>(backButtonClickedEvent);
   on<SignUpButtonClickedEvent>(signUpButtonClickedEvent);
  }

  FutureOr<void> backButtonClickedEvent(BackButtonClickedEvent event, Emitter<SignUpState> emit) {
  emit(BackButtonClickedActionState());
  }

  FutureOr<void> signUpButtonClickedEvent(SignUpButtonClickedEvent event, Emitter<SignUpState> emit)async{
  emit(SignUpLoadingState());
  try{
  await  _repo.signUp(userCred: event.userData);
  emit(SignUpLoadedState());

  }catch(e){
    emit(SignUpErrorState(errorTitle: 'Oopps!!',errorDesc: e.toString()));
  }
  }
}
