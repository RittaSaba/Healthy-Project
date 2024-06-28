import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'authenticated_service.dart';

class AuthenticatedController extends GetxController {
  // TextEditingController
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();

  //call AuthService
  AuthService service = AuthService();
  var authStatus = false;

  //vars of api response
  var message;
  var statusCodeOfResponse;

  // var messageOtpCode=''.obs;

  @override
  void onClose() {
    txt1.dispose();
    txt2.dispose();
    txt3.dispose();
    txt4.dispose();
    txt5.dispose();
    txt6.dispose();
    // otpEditingController.dispose();
    super.onClose();
    // SmsAutoFill().unregisterListener();
  }

//Verification Code function

/*  Future<void> verificationCodeOnClick() async {
    String code =
        txt1.text + txt2.text + txt3.text + txt4.text + txt5.text + txt6.text;
    authStatus = await service.verificationCode(code);
    statusCodeOfResponse = await service.statusCodeOfResponse;
    message = service.message;
    if (message is List) {
      String temp = '';
      for (String s in message) temp += s + '\n';
      message = temp;
    }
  }*/
}
