import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:temp_task2/app/LogIn/login_service.dart';
import 'package:temp_task2/config/api_services.dart';
import 'package:temp_task2/native_service/get_storage.dart';

import '../../config/end_points.dart';
import '../../core/models/user.dart';
import '../../routes/app_routes.dart';
import 'login_model_response.dart';

class LoginController extends GetxController {
  late UserStorage storage;
 // final getStorage = GetStorage();

  //vars of screen
  final signInFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  var checkBoxStatus;

  RxBool isPasswordHidden = true.obs;

  //vars of api call
  late String email;
  late String mobileNumber;
  late String password;
  var loginStatus = false;
  var statusCodeOfResponse;
  late String message;

  //vars of   LogIn Service
  late LogInService service;
  late LogInResponseModel logInResponseModel;
  @override
  void onInit() {
    email = '';
    mobileNumber = '';
    password = '';
    loginStatus = false;
    statusCodeOfResponse = '';
    message = '';
    service = LogInService();
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

  //Dio function call
  void userLogin(
      {required String email,
      required String password,
      required String phoneNumber}) {
    print(email);
    print(password);
    print(phoneNumber);
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    }).then((value) { print(value.data);
    logInResponseModel=LogInResponseModel.fromJson(value.data);
    message=logInResponseModel.message.toString();
    storage.save('access_token', logInResponseModel.accessToken.toString());
    storage.save('refresh_token', logInResponseModel.refreshToken.toString());
    print(message);
    }).catchError((error) {
      print(error);
    });
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
