import 'dart:convert';


import 'package:temp_task2/config/server_config.dart';
import 'package:temp_task2/core/models/user.dart';

class AuthService {


}
//var statusCodeOfResponse;
  //vars
 /* var message;
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.verificationEmail);
*/
/*  Future<bool> verificationCode(String code) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json',

    }, body: {
      'code': code,

    });

    print('*****************11111************************');
    print(response.statusCode);
    print('********************22222*********************');
    print(response.body);
    print('*******************33333**********************');

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
     // message = jsonResponse['message'];
      //print(jsonResponse['message']);
      return true;
    } else if (response.statusCode == 422) {
      var jsonResponse = jsonDecode(response.body);
    //  message = jsonResponse['message'];
    //  print(jsonResponse['message']);
      return false;
    } else {

      return false;
    }
  }*/

/*Future<Credentials> refreshToken() async {
  log('refresh-token');
  var credentials = await loadCredentails();
  try {
    if (credentials!.canRefresh) {
      var cre = await credentials.refresh(
          identifier: clientId, secret: clientSecret);

      await saveCredentails(cre);

      return cre;
    } else {
      throw 'Couuld not refresh the Token!';
    }
  } catch (e) {
    printError(
        info:
        'Oauth client service exception refreshToken:  ${e.toString()}');
    throw 'Oauth client service exception refreshToken:  ${e.toString()}';
  }
}*/


