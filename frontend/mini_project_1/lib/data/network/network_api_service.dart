import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mini_project_1/data/exceptions/app_exceptions.dart';
import 'package:mini_project_1/data/network/base_network_service.dart';

class NetworkApiService extends BaseNetworkService {
  @override
  Future<dynamic> getGetApiResponse(String? url) async {
    try {
      final response = await http.get(Uri.parse(url!)).timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on HttpException {
      throw FetchDataException('Failed to get data from the server');
    } on FormatException {
      throw FetchDataException('Bad response format');
    } catch (e) {
      throw FetchDataException('An unexpected error occurred: $e');
    }
  }

  @override
  Future<dynamic> getPostApiResponse(String? url, dynamic body) async {
    try {
      final response = await http.post(
        Uri.parse(url!),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on HttpException {
      throw FetchDataException('Failed to post data to the server');
    } on FormatException {
      throw FetchDataException('Bad response format');
    } catch (e) {
      throw FetchDataException('An unexpected error occurred: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        try {
          return jsonDecode(response.body);
        } catch (e) {
          throw FetchDataException('Error parsing response: $e');
        }
      case 400:
        throw BadRequestException('Bad request: ${response.body}');
      case 401:
        throw UnauthorizedException('Unauthorized request: ${response.body}');
      case 403:
        throw ForbiddenException('Forbidden request: ${response.body}');
      case 404:
        throw NotFoundException('Not found: ${response.body}');
      case 500:
        throw InternalServerErrorException('Server error: ${response.body}');
      default:
        throw FetchDataException('Error while communicating with server: ${response.statusCode}');
    }
  }
}
