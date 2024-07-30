import 'package:mini_project_1/utils/constants/api_const/api_constants.dart';
import 'package:mini_project_1/utils/helpers/network/api_helper.dart';

class SignUpRepo{
 final ApiHelper _apiHelper;

  SignUpRepo(this._apiHelper);
   Future<void> signUp({required Map<String,dynamic> userCred})async{
  try{
    final res = await  _apiHelper.post('${ApiConstants.baseUrl}/signup',body:userCred);
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