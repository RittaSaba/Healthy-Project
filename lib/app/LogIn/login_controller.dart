import 'dart:developer';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/app_routes.dart';

class LoginController extends GetxController {
  final signInFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();

  var checkBoxStatus = false.obs;
  final getStorage = GetStorage();
  final RxBool rememberMe = false.obs;

  RxBool isPasswordHidden = true.obs;



  @override
  void onInit() {
    rememberMe.value = getStorage.read('rememberMe') ?? false;
    super.onInit();
  }

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

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
    getStorage.write('rememberMe', value);
  }

  login() {
    final isValid=signInFormKey.currentState!.validate();
    if(!isValid){
      return;
    }
    signInFormKey.currentState!.save();
    //getStorage.write("id", 1);
    //getStorage.write("name", "Ripples Code");
    // Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {


    super.onClose();
  }


  String? validator(String? value) {
    log('validator');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

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
}
