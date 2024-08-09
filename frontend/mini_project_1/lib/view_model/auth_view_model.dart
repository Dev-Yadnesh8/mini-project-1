import 'package:flutter/material.dart';
import 'package:mini_project_1/repository/auth_repo.dart';
import 'package:mini_project_1/utils/flushbar/flush_bar_utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _repo =  AuthRepo();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  Future<dynamic> login(dynamic data,BuildContext context)async{
    setLoading(true);
    _repo.loginApi(data).then((value) {
      print(value);
      FlushBarUtils.showFlushBar(context: context, message: 'Logged in success',flushBarType: FlushBarType.success);
      setLoading(false);
    }).onError((error, stackTrace) {
      print(error);
      FlushBarUtils.showFlushBar(context: context, message: error.toString(),flushBarType: FlushBarType.error);
      setLoading(false);
    },);
  }

}