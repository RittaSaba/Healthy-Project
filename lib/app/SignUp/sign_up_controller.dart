import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class SignUpController extends GetxController {
  final getStorage = GetStorage();

  bool isLoading = false;

  // File?fileToDisplay;

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final signupFormKey = GlobalKey<FormState>();

  RxBool isPasswordHidden = true.obs;
  RxBool isPasswordConfirmHidden = true.obs;

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  //image picker

  RxString imagePath = ''.obs;
  var selectedImageSize = ''.obs;

//File ? selectedImage;

/*
  SignupController(AuthApiService authenticationService)
      : super(authenticationService);*/

  void onInit() {
    // _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  // void _addListener() {
  //   usernameFocusNode.addListener(() {
  //     log('usernameFocusNode-----${usernameFocusNode.hasFocus}');
  //     if (!usernameFocusNode.hasFocus) {
  //       userNameController.currentState!.validate();
  //       // fieldLostFocus = usernameController.hashCode.toString();
  //     }
  //   });
  //   emailFocusNode.addListener(() {
  //     log('emailFocusNode-----${emailFocusNode.hasFocus}');
  //     if (!emailFocusNode.hasFocus) {
  //       formEmailFieldKey.currentState!.validate();
  //     }
  //   });
  //   passwordFocusNode.addListener(() {
  //     if (!passwordFocusNode.hasFocus) {
  //       formPasswordFieldKey.currentState!.validate();
  //     }
  //   });
  //   confirmPasswordFocusNode.addListener(() {
  //     if (!confirmPasswordFocusNode.hasFocus) {
  //       formConfirmPasswordFieldKey.currentState!.validate();
  //     }
  //   });
  // }

  @override
  void onClose() {
    userNameController.dispose();
    //usernameFocusNode.dispose();
    emailController.dispose();
    // emailFocusNode.dispose();
    mobileNumberController.dispose();

    passwordController.dispose();
    // passwordFocusNode.dispose();
    confirmPasswordController.dispose();
    //  confirmPasswordFocusNode.dispose();

    super.onClose();
  }

  String? usernameValidator(String? value) {
    // if(fieldLostFocus == usernameController.hashCode)
    log('usernameValidator-----');
    if (value == null || value.trim().isEmpty) {
      return 'username field is required';
    }
    if (value.trim().length < 4) {
      return 'Username must be at least 4 characters in length';
    }
    // Return null if the entered username is valid
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'email field is required';
    }
    // Check if the entered email has the right format
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Please enter a valid email';
    }
    // Return null if the entered email is valid
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'password field is required';
    }
    if (value.trim().length < 9) {
      return 'Password must be at least 9 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? mobilePhoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'mobile phone field is required';
    }
    if (value.trim().length < 9) {
      return 'Mobile Phone must be at least 9 characters in length';
    }
    // Return null if the entered password is valid
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm password field is required';
    }
    log('${value}--${passwordController.value.text}');
    if (value != passwordController.value.text) {
      return 'Confirmation password does not match the entered password';
    }

    return null;
  }

  String? validator(String? value) {
    log('validator');

    if (value != null && value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

/*Future<void> signup() async {
    // log('${emailController.text}, ${passwordController.text}');
    if (signupFormKey.currentState!.validate()) {
      try {
        var data = <String, String>{
          'username': userNameController.text,
          'email': emailController.text,
        };
        if (ConfigAPI.loginWithPassword) {
          data = {
            ...data,
            'password': passwordController.text,
            'confirmPassword': confirmPasswordController.text,
          };
        }
        await signUp(data);
        if (ConfigAPI.loginWithPassword) {
          signIn(userNameController.text, passwordController.text);
        }
      } catch (err, _) {
        // message = 'There is an issue with the app during request the data, '
        //         'please contact admin for fixing the issues ' +

        passwordController.clear();
        confirmPasswordController.clear();
        rethrow;
      }
    } else {
      throw Exception('An error occurred, invalid inputs value');
    }
  }*/

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      getStorage.save();
      imagePath.value = image.path.toString();
      getStorage.write('profile image', image.path.toString());
    }
  }
}
