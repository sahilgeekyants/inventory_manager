class ResponseBody {
  dynamic data;
  Map<String, dynamic>? meta;

  ResponseBody({this.data, this.meta});
  ResponseBody.fromJson(Map<String, dynamic> json) {
    if (json.containsKey("data")) {
      data = json['data'];
    } else {
      data = json;
    }
    meta = json["meta"];
  }
}
