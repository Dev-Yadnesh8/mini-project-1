import 'package:mini_project_1/data/network/base_network_service.dart';
import 'package:mini_project_1/data/network/network_api_service.dart';
import 'package:mini_project_1/resources/app_urls.dart';

class AuthRepo {

final BaseNetworkService _apiService = NetworkApiService();

Future<dynamic> loginApi(dynamic data)async{
  try {
  final response =  await _apiService.getPostApiResponse(AppUrls.loginEndpoint, data);
  return response;
  } catch (e) {
    throw e.toString();
  }
}

}