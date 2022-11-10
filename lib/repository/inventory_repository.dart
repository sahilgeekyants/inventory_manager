// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_manager/serializers/login_user.dart';
import 'package:inventory_manager/serializers/response.dart';
import 'package:inventory_manager/serializers/response_body.dart';
import 'package:inventory_manager/services/api_service/index.dart';
import 'package:inventory_manager/services/config/config.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/utils/constants/api_request_types.dart';
import 'package:inventory_manager/utils/constants/messages.dart';

class InventoryRepository {
  // final String _apiKey = Config.apiKey;
  final String _baseUrl = Config.baseUrl;
  final String _language = Config.language;

  Future<Response> userLogin({
    required String userName,
    required String password,
  }) async {
    String url = "$_baseUrl/appUserLogin";
    Map<String, dynamic> body = {
      "rsUsername": userName,
      "rsPassword": password,
      "rsURL": _baseUrl,
      "language": _language
    };
    if (kDebugMode) {
      print("url : $url");
    }
    // Response response;
    try {
      Response response = await HttpService.httpRequests(url, ApiRequestType.POST, body: jsonEncode(body));
      if (kDebugMode) {
        print('login responseStatus : ${response.responseStatus}');
      }
      if (response.status!) {
        // If the call to the server was successful
        Map<String, dynamic> parsedJson = response.body!.data;
        if (parsedJson.isNotEmpty) {
          //
          LoginUser loginUser = LoginUser.fromJson(parsedJson);
          //save in sharedPref here
          localStorage.setAuthenticationInfo(userDetails: loginUser);
          return Response(
            status: true,
            body: ResponseBody(data: loginUser, meta: response.body!.meta),
            message: ToastMessages.succesMessage["success"],
          );
        } else {
          //Empty response
          return Response(
            status: false,
            body: null,
            message: ToastMessages.errorMessage["emptyData"],
          );
        }
      } else {
        // If that call was not successful, then return the error response
        return response;
      }
    } on Exception catch (e) {
      String errMsg = e.toString();
      if (kDebugMode) {
        print('exception inside login api call : $errMsg}');
      }
      if (errMsg.contains(ToastMessages.errorMessage[""]!)) {
        //
      }
      return Response(status: false, body: null, message: e.toString());
    }
  }

  //
  Future<Response> userLogOut() async {
    String url = "$_baseUrl/appUserlogout";
    String? userName = await localStorage.getUserName();
    if (userName != null) {
      Map<String, dynamic> body = {
        "rsUsername": userName,
      };
      if (kDebugMode) {
        print("url : $url");
      }
      // Response response;
      try {
        Response response = await HttpService.httpRequests(url, ApiRequestType.POST, body: jsonEncode(body));
        if (kDebugMode) {
          print('logout responseStatus : ${response.responseStatus}');
        }
        if (response.status!) {
          // If the call to the server was successful
          //save in sharedPref here
          localStorage.clearUserAndToken();
          return Response(
            status: true,
            body: response.body,
            message: ToastMessages.succesMessage["success"],
          );
        } else {
          // If that call was not successful, then return the error response
          return response;
        }
      } on Exception catch (e) {
        String errMsg = e.toString();
        if (kDebugMode) {
          print('exception inside login api call : $errMsg}');
        }
        if (errMsg.contains(ToastMessages.errorMessage[""]!)) {
          //
        }
        return Response(status: false, body: null, message: e.toString());
      }
    } else {
      //Empty response
      return Response(
        status: false,
        body: null,
        message: ToastMessages.errorMessage["emptyData"],
      );
    }
  }
}
