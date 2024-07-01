class VerifyResponse {
  String? message;

  VerifyResponse({this.message});

  VerifyResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
