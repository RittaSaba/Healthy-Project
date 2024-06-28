class LogInResponseModel {
  String? status;
  String? message;
  String? accessToken;
  String? refreshToken;

  LogInResponseModel(
      {this.status, this.message, this.accessToken, this.refreshToken});

  LogInResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
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
