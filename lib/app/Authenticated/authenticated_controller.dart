import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../config/api_services.dart';
import '../../config/end_points.dart';
import '../../core/models/resendCodeResponseModel.dart';
import '../../core/models/verify_response.dart';
import '../../native_service/get_storage.dart';


class AuthenticatedController extends GetxController {
  late UserStorage storage;
  // TextEditingController
  TextEditingController txt1 = TextEditingController();
  TextEditingController txt2 = TextEditingController();
  TextEditingController txt3 = TextEditingController();
  TextEditingController txt4 = TextEditingController();
  TextEditingController txt5 = TextEditingController();
  TextEditingController txt6 = TextEditingController();

  int fullFields=0;

  var authStatus = false;
@override
  void onInit() {
    storage=UserStorage();
    super.onInit();
  }
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
  void userVerificationEmail(
      {required String code,}) {
    print(code);
    DioHelper.postData(url: VERIFY_EMAIL, data: {
      'code': code,
    }).then((value) {
      print(value.data);
    message=value.data.toString();

    print(message);
    }).catchError((error) {
      print(error);
    });
  }
  Future<bool> userVerifyEmail() async {
    print('User Verify Email:');

    print('txt1 ');
    print(txt1.text );
    print('txt2 ');
    print(txt2.text );
    print('txt3 ');
    print(txt3.text );
    print('txt4 ');
    print(txt4.text );
    print('txt5 ');
    print(txt5.text );
    print('txt6 ');
    print(txt6.text );
    String code= txt1.text + txt2.text + txt3.text + txt4.text + txt5.text + txt6.text;

    print('Code: $code');

    try {
      dynamic response = await DioHelper.postData(url: 'api/auth/verify', data: {

        'code': code,
      });

      print('Response:');
      print(response.data);

      VerifyResponse verifyResponse = VerifyResponse.fromJson(response.data);
      print('Message: ${verifyResponse.message}');
      return true; // Indicate success
    } catch (error) {
      if (error is DioException) {
        print('DioException occurred:');
        print(error.message);

        if (error.response != null) {
          print('Response data:');
          print(error.response?.data);
          print('Status code:');
          print(error.response?.statusCode);
        }
      } else {
        print('An unexpected error occurred:');
        print(error);
      }
      return false; // Indicate failure
    }
  }
  Future<bool> userResendCode() async {
    print('User Send Code Again:');
    String email= storage.read('email');
    print('txt1 ');
    print(txt1.text );
    print('txt2 ');
    print(txt2.text );
    print('txt3 ');
    print(txt3.text );
    print('txt4 ');
    print(txt4.text );
    print('txt5 ');
    print(txt5.text );
    print('txt6 ');
    print(txt6.text );
    String code= txt1.text + txt2.text + txt3.text + txt4.text + txt5.text + txt6.text;
    print('Email: $email');
    print('Code: $code');

    try {
      dynamic response = await DioHelper.postData(url: 'api/auth/resend-code', data: {
        'email': email,
        'code': code,
      });

      print('Response:');
      print(response.data);

      ResendCodeAgainResponse resendCodeAgainResponse = ResendCodeAgainResponse.fromJson(response.data);
      print('Message: ${resendCodeAgainResponse.message}');
      return true; // Indicate success
    } catch (error) {
      if (error is DioException) {
        print('DioException occurred:');
        print(error.message);

        if (error.response != null) {
          print('Response data:');
          print(error.response?.data);
          print('Status code:');
          print(error.response?.statusCode);
        }
      } else {
        print('An unexpected error occurred:');
        print(error);
      }
      return false; // Indicate failure
    }
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
