import 'package:mini_project_1/utils/constants/api_const/api_constants.dart';
import 'package:mini_project_1/utils/helpers/network/api_helper.dart';

class LoginRepo{
 final ApiHelper apiHelper;

  LoginRepo({required this.apiHelper});

  Future<void> sendUserData({required Map<String,dynamic> userCred})async{
  try{
    final res = await  apiHelper.post('${ApiConstants.baseUrl}/signin',body:userCred);
    if(res.statusCode == 200){
      print("User logged in ");
    }else{
      throw 'Error in authentication ${res.statusCode}' ;
    }
  }catch(e){
    throw e.toString();
  }

  }
}