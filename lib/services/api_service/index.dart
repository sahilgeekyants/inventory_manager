import 'package:inventory_manager/serializers/response.dart';
// import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/utils/constants/api_request_types.dart';
import 'http_handler.dart';

class HttpService {
  ///[requestType] can be GET, POST, PUT, PATCH, DELETE
  static Future<Response> httpRequests(
    String url,
    ApiRequestType requestType, {
    Map<String, String>? headers,
    dynamic body,
  }) async {
    Map<String, String> myHeaders = {};
    if ((requestType == ApiRequestType.GET || requestType == ApiRequestType.DELETE) && (body != null)) {
      throw _errorResponse("You can not pass body or encoding to GET or DELETE request");
    }
    // if (headers == null) {
    //   var token = await localStorage.getToken();
    //   myHeaders = {"Authorization": "Bearer $token", "content-type": "application/json"};
    // } else {
    //   myHeaders = headers;
    // }
    return HttpServiceHelper.httpRequestsHandler(
      url,
      requestType,
      headers: myHeaders,
      body: body,
    );
  }

  static Response _errorResponse(String message) {
    return Response.fromJson({
      'status': false,
      'body': null,
      'message': message,
      'headers': {},
      'response_status': 0,
    });
  }
}
