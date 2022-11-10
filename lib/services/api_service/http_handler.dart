import "dart:convert";
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:inventory_manager/serializers/response.dart';
// import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/utils/constants/api_request_types.dart';

class HttpServiceHelper {
  static Future<Response> httpRequestsHandler(
    String url,
    ApiRequestType requestType, {
    Map<String, String>? headers,
    dynamic body,
    Encoding? encoding,
  }) async {
    http.Response? response;
    try {
      switch (requestType) {
        case ApiRequestType.GET:
          if (kDebugMode) {
            print("url is GET ------------------------------- $url");
          }
          response = await http.get(Uri.parse(url), headers: headers);
          break;

        case ApiRequestType.POST:
          if (kDebugMode) {
            print("url is POST ------------------------------- $url");
          }
          response = await http.post(Uri.parse(url), headers: headers, body: body, encoding: encoding);
          break;
        case ApiRequestType.PUT:
          response = await http.put(Uri.parse(url), headers: headers, body: body, encoding: encoding);
          break;
        case ApiRequestType.PATCH:
          response = await http.patch(Uri.parse(url), headers: headers, body: body, encoding: encoding);
          break;
        case ApiRequestType.DELETE:
          response = await http.delete(Uri.parse(url), headers: headers);
          break;
        // case ApiRequestType.MULTIPART:
        //   var uri = Uri.parse(url);
        //   var request = http.MultipartRequest("POST", uri);
        //   request.files.clear();

        //   if (body["data"] != null) {
        //     request.fields["data"] = body["data"];
        //   }

        //   request.files.addAll(body['files']);
        //   var token = await localStorage.getToken();
        //   request.headers['Authorization'] = "Bearer $token";
        //   var res = await request.send();
        //   response = await http.Response.fromStream(res);
        //   break;
        default:
          throw "No method type match";
      }
    } catch (exception) {
      print("error ocuured --->> $exception");
      if (exception.runtimeType == SocketException) {
        return _HttpServiceHelper._errorResponse(response, url, headers, body.toString(),
            errorMessage: "No Internet, Please Try again later");
      } else {
        return _HttpServiceHelper._errorResponse(response, url, headers, body.toString(), errorMessage: "Http error");
      }
    }
    return _HttpServiceHelper._handleResponse(response, requestType, url, headers, body, encoding);
  }
}

class _HttpServiceHelper {
  static Future<Response> _handleResponse(http.Response? response, ApiRequestType requestType, String url,
      Map<String, String>? headers, dynamic body, Encoding? encoding) {
    if (response != null) {
      return _identifyResponse(response, requestType, url, headers, body, encoding);
    }
    throw _errorResponse(response, url, headers, body, errorMessage: "response is null");
  }

  static Future<Response> _identifyResponse(http.Response response, ApiRequestType requestType, String url,
      Map<String, String>? headers, dynamic body, Encoding? encoding) async {
    final int _statusCode = response.statusCode;
    String loginUrl = "";
    if (_statusCode == 401 && url != loginUrl) {
      // //call the refreshToken api
      // Response? refreshResponse = await Authentication().refreshToken(requestType, url, headers, body);
      // if (refreshResponse != null) {
      //   return refreshResponse;
      // } else {
      //   return _errorResponse(response, url, headers, body, errorMessage: "response is null");
      // }
      return _errorResponse(response, url, headers, body, errorMessage: "session is expired");
    } else if (_statusCode >= 400 && _statusCode != 401) {
      if (kDebugMode) {
        print("inside >= 400 of url --> $url and body is ${response.body}");
      }
      return resolveResponse(response);
    } else if (_statusCode >= 200 && _statusCode < 300) {
      return resolveResponse(response);
    } else {
      return _errorResponse(response, url, headers, body, errorMessage: "${response.body}");
    }
  }

  static resolveResponse(http.Response apiResponse) {
    try {
      bool apiStatus = false;
      if (apiResponse.statusCode >= 200 && apiResponse.statusCode < 300) {
        apiStatus = true;
      }
      return Response.fromJson({
        'status': apiStatus,
        'body': apiResponse.body,
        'message': apiStatus ? 'API call successfully done' : 'Something went wrong, please try again',
        'header': apiResponse.headers,
        'response_status': apiResponse.statusCode
      });
    } catch (e) {
      if (kDebugMode) {
        print("error occured in resolving response with $e");
      }
      return _errorResponse(apiResponse, "", {}, "", errorMessage: "Unable to decode body");
    }
  }

  static Response _errorResponse(http.Response? errorResponse, String url, Map<String, dynamic>? headers, dynamic body,
      {String? errorMessage}) {
    String responseMessage = "";
    if (errorMessage != null) {
      responseMessage = errorMessage;
    } else if (errorResponse != null && errorResponse.body != null) {
      responseMessage = "akanksha error";
    }
    if (errorResponse != null) {
      if (kDebugMode) {
        print("errorResponse.headers is ${errorResponse.headers} with type is ${errorResponse.headers.runtimeType}");
      }
    }

    return Response.fromJson({
      'status': false,
      'body': null,
      'message': responseMessage,
      'header': errorResponse?.headers,
      'response_status': errorResponse != null ? errorResponse.statusCode : -1,
    });
  }
}
