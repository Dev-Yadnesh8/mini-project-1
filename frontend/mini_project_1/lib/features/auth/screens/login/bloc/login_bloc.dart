import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mini_project_1/features/auth/screens/login/repo/login_repo.dart';
import 'package:mini_project_1/utils/helpers/network/api_helper.dart';


import '../../../controllers/authentication_cubit.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo = LoginRepo(apiHelper: ApiHelper());
  final AuthenticationCubit _authenticationCubit;
  LoginBloc(this._authenticationCubit) : super(LoginInitialState()) {
    on<LoginButtonClickedEvent>(loginButtonClickedEvent);
    on<CreateOneButtonClickActionEvent>(createOneButtonClickActionEvent);
  }

  FutureOr<void> loginButtonClickedEvent(LoginButtonClickedEvent event, Emitter<LoginState> emit) async{
    emit(LoginLoadingState());
    // _authenticationCubit.logIn();
    // emit(LoginLoadedState());
    try{
    await  _loginRepo.sendUserData(userCred: event.userCred);
    _authenticationCubit.logIn();
     emit(LoginLoadedState());
    }catch(e){
      emit(LoginErrorState(errorTitle: 'Something went wrong!!!',errorDesc: e.toString()));
      emit(LoginInitialState());
    }
  }

  FutureOr<void> createOneButtonClickActionEvent(CreateOneButtonClickActionEvent event, Emitter<LoginState> emit) {
  emit(CreateOneButtonClickActionState());
  }
}
