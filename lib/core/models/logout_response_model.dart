class LogOutModel {
  String? data;
  String? message;

  LogOutModel({this.data, this.message});

  LogOutModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['data'] = this.data;
    data['message'] = this.message;
    return data;
  }
}
