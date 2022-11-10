class LoginUser {
  // String? id;
  String? locale;
  String? region;
  String? userLocation;
  String? orgName;
  String? orgId;
  String? userName;
  String? instance;
  String? role;

  LoginUser({
    this.locale,
    this.region,
    this.userLocation,
    this.orgName,
    this.orgId,
    this.userName,
    this.instance,
    this.role,
  });

  LoginUser.fromJson(Map<String, dynamic> json) {
    locale = json['ssLocale'];
    region = json['ssRegion'];
    userLocation = json['ssUserlocat'];
    orgName = json['ssOrgname'];
    orgId = json['ssOrgId'];
    userName = json['ssUsername'];
    instance = json['ssInstance'];
    role = json['ssRole'];
  }

  Map<String, dynamic> toJson(LoginUser user) {
    Map<String, dynamic> json = {};
    json.addAll({
      "ssLocale": user.locale,
      "ssRegion": user.region,
      "ssUserlocat": user.userLocation,
      "ssOrgname": user.orgName,
      "ssOrgId": user.orgId,
      "ssUsername": user.userName,
      "ssInstance": user.instance,
      "ssRole": user.role,
    });
    return json;
  }
}
