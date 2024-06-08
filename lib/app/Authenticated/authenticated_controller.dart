import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthenticatedController extends GetxController {
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();

  // var messageOtpCode=''.obs;
  @override
  void onInit() async {
    super.onInit();
    // print(SmsAutoFill().getAppSignature);
  }

  @override
  void onReady() {
    super.onReady();
  }

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
}
