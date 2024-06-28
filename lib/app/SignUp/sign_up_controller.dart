import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:temp_task2/app/SignUp/sign_up_model.dart';
import '../../config/api_services.dart';
import '../../config/end_points.dart';

class SignUpController extends GetxController {
  final getStorage = GetStorage();

  //vars of screen
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final signupFormKey = GlobalKey<FormState>();

  RxBool isPasswordHidden = true.obs;
  RxBool isPasswordConfirmHidden = true.obs;
  RxString imagePath = ''.obs;
  var selectedImageSize = ''.obs;

  FocusNode usernameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode mobileNumberFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  //vars of api call
  late String userName;
  late String email;

  late String mobileNumber;

  late String password;
  late String confirmPassword;
  late String filePathing;
  late String fileName;
  late String imagePathing;
  late String imageName;

  late SignUpResponseModel signUpResponseModel;

  // late XFile image;
  // late XFile file;

  //vars of   SignUp Service
  // ApiServices servicesWithDio = ApiServices();
//  SignUpService service = SignUpService();
  var statusCodeOfResponse;

  //vars of api response
  String message = '';
  bool signUpStatus = false;
  bool isLoading = false;

  @override
  void onInit() {
    userName = '';
    email = '';
    mobileNumber = '';
    password = '';
    confirmPassword = '';
    filePathing = '';
    imagePathing = '';
    imageName = '';

    // _addListener();
    // textFieldFocusNode.hasFocus = false;
    super.onInit();
  }

  Future userRegister({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
    required String phoneNumber,
    required String imagePathing,
    required String imageName,
    required String filePath,
    required String fileName,
  }) async {
    print(name);
    print(email);
    print(password);
    print(passwordConfirmation);
    print(phoneNumber);
    DioHelper.register(
            name: name,
            email: email,
            password: password,
            passwordConfirmation: passwordConfirmation,
            phoneNumber: phoneNumber,
            imagePathing: imagePathing,
            imageName: imageName,
            filePathing: filePath,
            fileName: fileName)
        .then((value) {
      print(value.data);
     // signUpResponseModel = SignUpResponseModel.fromJson(value.data);
     // message = signUpResponseModel.message.toString();
     // print(message);
    }).catchError((error) {
      print(error);
    });
  }

//Register OnClick Function
  /* Future registerOnClick() async {

  try{

    // print(jsonEncode(image));
    // convertImage(image);
    // convertFile(file);
    await service.sendImage(name: userName,
        email: email,
        password: password,
        passwordConfirmation: confirmPassword,
        phoneNumber: mobileNumber,
        certificate: file,
         imageProfilePathing: imagePathing) ;
message=signUpModel.message;
print(message);
    // message = service.message;
    // statusCodeOfResponse = service.statusCodeOfResponse;
    // if (message is List) {
    //   String temp = '';
    //   for (String s in message)
    //     temp += s + '\n';
    //   message = temp;
    // }
    // print('message is : $message');
  }catch(e){
    return Future.error(e);

  }
  }*/

/*
  SignupController(AuthApiService authenticationService)
      : super(authenticationService);*/

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

  // Future convertImage(var image) async {
  //   Uint8List imageBytes = await image.readAsBytes(); //convert to bytes
  //   String base64string = base64.encode(
  //       imageBytes); //convert bytes to base64 string
  //   imagePathing = base64string;
  // }
  //
  // Future convertFile(var file) async {
  //   Uint8List fileBytes = await image.readAsBytes(); //convert to bytes
  //   String base64string = base64.encode(
  //       fileBytes); //convert bytes to base64 string
  //   filePathing = base64string;
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
//Function called by screen
  Future getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      imageName = file.path.split('/').last;
      imagePathing = file.path;
      getStorage.write('profile image', file.path.toString());
    } else {
      print("result image is null");
    }
    //  image = (await picker.pickImage(source: ImageSource.gallery))!;
    //   if (image.path.isNotEmpty) {
    //     getStorage.write('profile image', image.path.toString());
    //
    //     imagePath.value = image.path.toString();
    //imagePathing = image.path.toString();
    //     print("image pathing");
    //     print(imagePathing);
    //   }
  }

  void openFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? " ");
      fileName = file.path.split('/').last;
      filePathing = file.path;
    } else {
      print("result file is null");
    }
  }

  //validation
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
    if (value.trim().length < 6) {
      return 'Mobile Phone must be at least 6 characters in length';
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
}
