abstract class BaseNetworkService {
  Future<dynamic> getGetApiResponse(String? url);
  Future<dynamic> getPostApiResponse(String? url,dynamic body);
}