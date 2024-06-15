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

  // //Confetti Animation
  // var isPlaying = false.obs;
  // late ConfettiController confettiController;

  @override
  void onInit() {
    //Confetti Animation
    // confettiController = ConfettiController();
    rememberMe.value = getStorage.read('rememberMe') ?? false;
    super.onInit();
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
    getStorage.write('rememberMe', value);
  }

  login() {
    getStorage.write("id", 1);
    getStorage.write("name", "Ripples Code");
    // Get.offAllNamed(Routes.HOME);
  }

  @override
  void onClose() {
    //Confetti Animation
    // confettiController.dispose();

    //emailController.dispose();
    //passwordController.dispose();
    super.onClose();
  }

  //Confetti Animation
  // startConfettiAnimation() {
  //   if (confettiController.state == ConfettiControllerState.playing) {
  //     isPlaying.value = false;
  //     confettiController.stop();
  //   } else {
  //     isPlaying.value = true;
  //     confettiController.play();
  //   }
  // }
  String? validator(String? value) {
    log('validatoooor');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }
/*
  void changeCheckBox() async{
  changeCheckBox(!(changeCheckBox.value));
 // String?test=await getStorage.read('token');

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
}
