import 'dart:convert';
import 'dart:ffi';

import 'package:temp_task2/config/user_information.dart';

import '../../config/server_config.dart';

import '../../core/models/user.dart';
import '../../native_service/get_storage.dart';

class LogInService{}

/* {
  var message;
  var token;
  var statusCodeOfResponse;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  Future<bool> LogIn(User user, bool checkBox) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',

    }, body: {
      'email': user.email,
      'phone_number': user.phoneNumber,
      'password': user.password,

      // 'profile_photo': user.profilePhoto,
      // 'certificate': user.certificate,
    });
    print('*****************11111************************');
    print(response.statusCode);
    statusCodeOfResponse = response.statusCode;
    print('********************22222*********************');
    print(response.body);
    print('*******************33333**********************');
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      token = jsonResponse['access_token'];
      UserInformation.USER_TOKEN = token;
      if (checkBox) {
        //save token to device
        UserStorage storage=UserStorage();
      await  storage.save('token', UserInformation.USER_TOKEN);
      }
      print('********************* test **********************');
      print(UserInformation.USER_TOKEN);

      return true;
    } else if (response.statusCode == 401) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      //   print(jsonResponse['message']);
      return false;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      //   print(message['errors']);
      return false;
    } else {
      var jsonResponse = jsonDecode(response.body);
      message = jsonResponse['message'];
      //  print(message['errors']);
      //  message = 'Server Error';
      return false;
    }
  }
}*/
