import 'dart:convert';

import 'package:inventory_manager/serializers/response_body.dart';

class Response {
  bool? status;
  int? responseStatus;
  ResponseBody? body;
  String? message;
  dynamic headers;

  Response({this.status, this.message, this.headers, this.body});

  // (Note: for now here backend provides no content body for 204 statusCode)
  Response.fromJson(Map<String, dynamic> json) {
    status = json['status'];

    headers = json['header'];
    responseStatus = json['response_status'];
    //check for not null body with statusCode other than 204 only
    if (json['response_status'] != 204 && (json['body'] != null)) {
      Map<String, dynamic> bodyResponse = jsonDecode(json['body']);
      //parse cera response
      if (bodyResponse.containsKey("isSuccess")) {
        //check for success
        if (bodyResponse["isSuccess"]) {
          body = ResponseBody.fromJson(bodyResponse);
          message = json['message'];
        } else {
          // error handling
          message = bodyResponse["data"]["error_message"];
          body = null;
        }
        // parse generic response
      } else {
        body = ResponseBody.fromJson(bodyResponse);
        message = json['message'];
      }
    } else {
      // when response/body is null
      body = null;
      message = json['message'];
    }
  }
}
