class LoginResponseModel {
  String? status;
  String? message;
  String? accessToken;
  String? refreshToken;

  LoginResponseModel(
      {this.status, this.message, this.accessToken, this.refreshToken});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['data']['status'];
    message = json['message'];
    accessToken = json['data']['access_token'];
    refreshToken = json['data']['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['access_token'] = this.accessToken;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}
