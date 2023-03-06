import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'app_exception.dart';
import 'base_api_service.dart';

class NetworkApiService extends BaseApiService {

  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final Map<String, String> params =
      {
        "api_key": API_KEY
      };
      final uri = Uri.https(BASE_URL, url, params);
      final response = await http.get(uri);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
}