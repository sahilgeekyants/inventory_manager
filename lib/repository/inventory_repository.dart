// ignore_for_file: unused_field

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:inventory_manager/serializers/login_user.dart';
import 'package:inventory_manager/serializers/products_list.dart';
import 'package:inventory_manager/serializers/response.dart';
import 'package:inventory_manager/serializers/response_body.dart';
import 'package:inventory_manager/services/api_service/index.dart';
import 'package:inventory_manager/services/config/config.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/utils/constants/api_request_types.dart';
import 'package:inventory_manager/utils/constants/messages.dart';
import 'package:inventory_manager/services/helpers/extensions.dart';

import '../utils/constants/user_roles.dart';

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
    if (kDebugMode) print("url : $url");
    // Response response;
    try {
      Response response = await HttpService.httpRequests(url, ApiRequestType.POST, body: jsonEncode(body));
      if (kDebugMode) print('login responseStatus : ${response.responseStatus}');
      if (response.status!) {
        // If the call to the server was successful
        Map<String, dynamic> parsedJson = response.body!.data;
        if (parsedJson.isNotEmpty && parsedJson.keys.contains("ERROR_MESG")) {
          //Wrong username/password
          return Response(
            status: false,
            body: null,
            message: parsedJson["ERROR_MESG"],
          );
        } else if (parsedJson.isNotEmpty && parsedJson.keys.contains("ssUsername")) {
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
      if (kDebugMode) print('exception inside login api call : $errMsg}');
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
      if (kDebugMode) print("url : $url");
      // Response response;
      try {
        Response response = await HttpService.httpRequests(url, ApiRequestType.POST, body: jsonEncode(body));
        if (kDebugMode) {
          print('logout responseStatus : ${response.responseStatus}');
          print('logout response, status : ${response.status}');
          print('response.body is String : ${response.body is String}');
          // ignore: unrelated_type_equality_checks
          print('response.body == Success : ${response.body == 'Success'}');
        }
        // if (response.status!) {
        //here in logout api response body is "Success" so this causes error in jsonDecode
        //so using response status to check success
        // if (response.responseStatus! == 200 && response.body is String && response.body == 'Success') {
        if (response.responseStatus! == 200) {
          if (kDebugMode) print("logout success status in repository with 200 status");
          // If the call to the server was successful
          //save in sharedPref here
          localStorage.clearUserAndToken();
          return Response(
            status: true,
            body: response.body,
            // body: ResponseBody(data: '', meta: {}),
            message: ToastMessages.succesMessage["success"],
          );
        } else {
          if (kDebugMode) print("logout failed status in repository");
          // If that call was not successful, then return the error response
          return response;
        }
      } on Exception catch (e) {
        String errMsg = e.toString();
        if (kDebugMode) print('exception inside login api call : $errMsg}');
        if (errMsg.contains(ToastMessages.errorMessage[""]!)) {
          //
        }
        return Response(status: false, body: null, message: e.toString());
      }
    } else {
      if (kDebugMode) print('username is not present in local storage, so logout user');
      //username is not present in local storage
      //give logout success state
      localStorage.clearUserAndToken();
      return Response(
        status: true,
        body: ResponseBody(data: '', meta: {}),
        message: ToastMessages.succesMessage["success"],
      );
    }
  }

  //Data Fetch Api
  Future<Response> getTableData({
    required String userName,
    required String orgId,
    required UserRole forRole,
  }) async {
    String apiReqId =
        (forRole == UserRole.SURVEYOR_QC) ? "A187EF915A7440A4A367838D1FE4DA3E" : "DACBAAC998424EECB1AF76D4FC342CEF";
    String url = "$_baseUrl/getApiRequestResultsData";
    Map<String, dynamic> body = {
      "apiReqId": apiReqId,
      "apiReqCols": "",
      "apiReqWhereClause": "",
      "apiReqOrgnId": orgId,
      "apiReqUserId": userName,
      "apiRetType": "JSON",
    };
    if (kDebugMode) print("url : $url");
    try {
      Response response = await HttpService.httpRequests(url, ApiRequestType.POST, body: jsonEncode(body));
      if (kDebugMode) print('getTableData responseStatus : ${response.responseStatus}');
      //sample empty api response -
      //{"Message":"Api ID Not available, Please contact provider","apiReqId":"DACBAAC998424EECB1AF76D4FC342CE","apiReqCols":"","apiDataArray":[],"apiReqOrgnId":"C1F5CFB03F2E444DAE78ECCEAD80D27D"}
      if (response.status!) {
        // If the call to the server was successful
        Map<String, dynamic> parsedJson = response.body!.data;
        if (parsedJson.isNotEmpty) {
          String? apiReqCols = parsedJson["apiReqCols"] as String?;
          List<dynamic> apiDataArray = parsedJson["apiDataArray"] as List<dynamic>;
          if (apiReqCols.isNotNullOrEmpty) {
            if (apiDataArray.isNotNullOrEmpty) {
              ProductsList productsList = ProductsList.fromJson(apiDataArray);
              // //save in sharedPref here
              // localStorage.setAuthenticationInfo(userDetails: loginUser);
              return Response(
                status: true,
                body: ResponseBody(data: productsList, meta: response.body!.meta),
                message: ToastMessages.succesMessage["success"],
              );
            } else {
              //getting empty data from api
              return Response(
                status: true,
                body: ResponseBody(data: [], meta: response.body!.meta),
                message: ToastMessages.errorMessage["emptyData"],
              );
            }
          } else {
            //did not get the req data from api
            String? errorMsg = parsedJson["Message"] as String?;
            return Response(
              status: false,
              body: null,
              message: errorMsg ?? ToastMessages.errorMessage["emptyData"],
            );
          }
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
      if (kDebugMode) print('exception inside login api call : $errMsg}');
      if (errMsg.contains(ToastMessages.errorMessage[""]!)) {
        //
      }
      return Response(status: false, body: null, message: e.toString());
    }
  }
}
