import 'package:flutter/foundation.dart';
import 'package:inventory_manager/serializers/login_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocalStorage {
  static late SharedPreferences _prefs;

  static Future setLocalStorage() async {
    if (kDebugMode) {
      print("initialising the shared preference");
    }
    _prefs = await SharedPreferences.getInstance();
  }

  Future setAuthenticationInfo({required LoginUser userDetails}) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setString("self_locale", userDetails.locale ?? "");
    _prefs.setString("self_region", userDetails.region ?? "");
    _prefs.setString("self_user_location", userDetails.userLocation ?? "");
    _prefs.setString("self_org_name", userDetails.orgName ?? "");
    _prefs.setString("self_org_id", userDetails.orgId ?? "");
    _prefs.setString("self_user_name", userDetails.userName ?? "");
    _prefs.setString("self_instance", userDetails.instance ?? "");
    _prefs.setString("self_role", userDetails.role ?? "");
  }

  Future<String?> getUserName() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs.getString("self_user_name");
  }

  // Future setToken(token) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _prefs.setString("access_token", token);
  // }

  // Future getToken() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   var token = _prefs.getString("access_token");
  //   return token;
  // }

  // Future setDeviceId(String deviceId) async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _prefs.setString("device_id", deviceId);
  // }

  Future clearUserAndToken() async {
    _prefs = await SharedPreferences.getInstance();
    await _prefs.clear();
  }

  // Future getUserId() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   return _prefs.getInt("userId");
  // }

  // Future getDeviceId() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   return _prefs.getString("device_id");
  // }
}

MyLocalStorage localStorage = MyLocalStorage();
