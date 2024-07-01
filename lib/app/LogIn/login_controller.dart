import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:temp_task2/config/api_services.dart';
import 'package:temp_task2/native_service/get_storage.dart';

import '../../config/end_points.dart';
import '../../core/models/login_response_model.dart';

class LoginController extends GetxController {
  late UserStorage storage;

  // final getStorage = GetStorage();

  //vars of screen
  final signInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  var checkBoxStatus;
  int? statusCode = 0;
  RxBool isPasswordHidden = true.obs;

  //vars of api call
  late String email;
  late String mobileNumber;
  late String password;
  var loginStatus = false;
  var statusCodeOfResponse;
  late String message;


  late LoginResponseModel logInResponseModel;

  @override
  void onInit() {
    email = '';
    mobileNumber = '';
    password = '';
    loginStatus = false;
    statusCodeOfResponse = '';
    message = '';
    checkBoxStatus = false.obs;
    storage = UserStorage();
    super.onInit();
  }

//function call by screen

  void changeCheckBox() async {
    checkBoxStatus(!checkBoxStatus.value);

    String? test = await storage.read('token');
    print('** token is **:$test');
  }


  Future<bool> userLogin({
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    print('User Login:');
    print('Email: $email');
    print('Password: $password');
    print('Phone Number: $phoneNumber');

    try {
      dynamic response = await DioHelper.postData(url: 'api/auth/login', data: {
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
      });

      print('Response:');
      print(response.data);

      LoginResponseModel logInResponseModel =
          LoginResponseModel.fromJson(response.data);
      print("Status Code ");
      print('${logInResponseModel.status}');
print('access_token ');
print('${logInResponseModel.accessToken}');
      print("refresh_token");
      print('${logInResponseModel.refreshToken}');

storage.save('access_token', '${logInResponseModel.accessToken}');
      storage.save('refresh_token','${logInResponseModel.refreshToken}');

      print('Message: ${logInResponseModel.message}');
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
          statusCode = error.response?.statusCode!;
        }
      } else {
        print('An unexpected error occurred:');
        print(error);
      }
      return false; // Indicate failure
    }
  }

  Future<void> loginOnClick() async {
    /*  User user = User(
      email: email,
      phoneNumber: mobileNumber,
      password: password,
    );
    String? token= await storage.read('token');
    loginStatus = await service.LogIn(user,checkBoxStatus.value);
    statusCodeOfResponse =await service.statusCodeOfResponse;

    message = service.message;*/
    /*  if(message is List){
      String temp='';
      for(String s in message)
        temp+=s+'\n';
      message=temp;
    }*/
  }

  /* login() {
    final isValid = signInFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signInFormKey.currentState!.save();
    //getStorage.write("id", 1);
    //getStorage.write("name", "Ripples Code");
    // Get.offAllNamed(Routes.HOME);
  }*/

/*
  Future<void> login() async {
    log('${emailController.text}, ${passwordController.text}');
    if (loginFormKey.currentState!.validate()) {
      try {
        await signIn(emailController.text, passwordController.text);
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        passwordController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value');
    }
  }*/

/* Future<void> loginWithBrowser() async {
    try {
      log('Login with browser');
      log('is authenticated: ${isAuthenticated()}');
      // await OAuthClient().createClient();
      // await signIn(emailController.text, passwordController.text);
    } catch (err, _) {
      rethrow;
    }
  }*/

//validation

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    // Check if the entered email has the right format
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    // Return null if the entered email is valid
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 8) {
      return 'Password must be at least 8 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? mobilePhoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'This field is required';
    }
    if (value.trim().length < 9) {
      return 'Mobile Phone must be at least 9 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? validator(String? value) {
    log('validator');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }
}
