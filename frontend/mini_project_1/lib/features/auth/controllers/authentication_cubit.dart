// authentication_cubit.dart

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial()) {
    _loadAuthState();
  }

  void logIn() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', true);
    emit(AuthenticationAuthenticated());
    print('User logged in');
  }

  void logOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isAuthenticated', false);
    // implement logout state here
    emit(AuthenticationUnauthenticated());
    print('User logged out');
  }

  void _loadAuthState() async {
    final prefs = await SharedPreferences.getInstance();
    final isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    if (isAuthenticated) {
      emit(AuthenticationAuthenticated());
    } else {
      emit(AuthenticationUnauthenticated());
    }
    print('Loaded authentication state: $isAuthenticated');
  }
}
