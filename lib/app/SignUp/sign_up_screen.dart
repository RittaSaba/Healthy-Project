import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/LogIn/login_controller.dart';
import 'package:temp_task2/app/SignUp/sign_up_controller.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/components/custom_text_form_field.dart';
import '../../core/functions/button_audio.dart';
import '../../core/functions/get_device_type.dart';
import '../../routes/app_routes.dart';
import '../../theme/themes.dart';
import '../Success/success_bottom_sheet.dart';
import '../Success/success_controller.dart';
import '../WrongMessage/wrong_message_dialog.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return Scaffold(
      body: deviceOrientation == Orientation.portrait
          ? Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: Themes.backgroundColorGradient,
              ),
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.signupFormKey,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 13.1.h,
                      ),
                      Container(
                        width: 24.w,
                        height: 10.5.h,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: Themes.fontColor1),
                          shape: BoxShape.circle,
                        ),
                        child: Obx(() => GestureDetector(
                              child: CircleAvatar(
                                backgroundColor:
                                    Colors.transparent.withOpacity(0),
                                radius: 5.25.h,
                                backgroundImage: controller.imagePath.value.isNotEmpty
                                    ? FileImage(File(controller.getStorage
                                        .read('profile image')))
                                    : null,
                                child: controller.imagePath.value.isNotEmpty
                                    ? null
                                    : SvgPicture.asset(
                                        'assets/images/camera.svg',
                                        color: Themes.fontColor1,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              onTap: () {
                                controller.getImage();
                              },
                            )),
                      ),
                      SizedBox(
                        height: 6.4.h,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          controller.userName = value;
                        },
                        isPassword: false,

                        controller: controller.userNameController,
                        textInputType: TextInputType.name,

                        labelText: 'Username',
                        hintText: 'Enter your name',
                        validate: controller.usernameValidator,
                        //  suffix_icon: Icons.cancel,
                        focusNode: controller.usernameFocusNode,
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .fadeIn(curve: Curves.easeOut)
                          .then()
                          .flip(),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          controller.email = value;
                        },
                        isPassword: false,

                        focusNode: controller.emailFocusNode,
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,

                        labelText: 'Email',
                        hintText: 'Enter your email',
                        //  validate: controller.emailValidator,
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Themes.iconColorAtTextFormField,
                        ),
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .fadeIn(curve: Curves.easeOut)
                          .then()
                          .flip(),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          controller.mobileNumber = value;
                        },
                        isPassword: false,

                        focusNode: controller.mobileNumberFocusNode,
                        controller: controller.mobileNumberController,
                        textInputType: TextInputType.phone,

                        labelText: 'Mobile Number',
                        hintText: 'Enter your mobile phone',
                        validate: controller.mobilePhoneValidator,
                        //     suffix_icon: Icons.cancel,
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .fadeIn(curve: Curves.easeOut)
                          .then()
                          .flip(),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          onChange: (value) {
                            controller.password = value;
                          },
                          isPassword: controller.isPasswordHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              buttonAudio("song_assets/bubble.mp3");
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),

                          focusNode: controller.passwordFocusNode,
                          controller: controller.passwordController,
                          textInputType: TextInputType.visiblePassword,

                          labelText: 'Password',
                          hintText: 'Enter your password',
                          validate: controller.passwordValidator,
                          //    suffix_icon: Icons.visibility_off,
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                      ),
                      SizedBox(
                        height: 1.8.h,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          onChange: (value) {
                            controller.confirmPassword = value;
                          },
                          isPassword: controller.isPasswordConfirmHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordConfirmHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              buttonAudio("song_assets/bubble.mp3");
                              controller.isPasswordConfirmHidden.value =
                                  !controller.isPasswordConfirmHidden.value;
                            },
                          ),
                          focusNode: controller.confirmPasswordFocusNode,
                          controller: controller.confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,
                          labelText: 'Confirm Password',
                          hintText: 'Enter your password',
                          validate: controller.confirmPasswordValidator,
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      MaterialButton(
                        onPressed: () {
                          buttonAudio("song_assets/bubble.mp3");
                          controller.openFile();
                        },
                        height: 4.3.h,
                        minWidth: 43.w,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Themes.borderFieldColor, width: 1.0),
                        ),
                        color: Themes.dialogColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomMontagaText(
                                text: 'Certificate PDF file   ',
                                size: 14.sp,
                                lineHeight: 17.01,
                                fontWeight: '500',
                                color: Themes.fontColorAtTextFormField,
                                textAlign: TextAlign.center),
                            SvgPicture.asset(
                              'assets/images/up.svg',
                              color: Themes.iconColor,
                              height: 3.h,
                              width: 8.2.w,
                              fit: BoxFit.none,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .slideX(),
                      SizedBox(
                        height: 4.5.h,
                      ),
                      CustomTextButton(
                              onSubmit: () {
                                buttonAudio("song_assets/bubble.mp3");
                                String? emailError = controller.emailValidator(
                                    controller.emailController.text);
                                String? phoneError =
                                    controller.mobilePhoneValidator(
                                        controller.mobileNumberController.text);
                                String? usernameError =
                                    controller.usernameValidator(
                                        controller.userNameController.text);
                                String? passwordError =
                                    controller.passwordValidator(
                                        controller.passwordController.text);
                                String? confirmPasswordError = controller
                                    .confirmPasswordValidator(controller
                                        .confirmPasswordController.text);
                                if (emailError != null ||
                                    phoneError != null ||
                                    usernameError != null ||
                                    passwordError != null ||
                                    confirmPasswordError != null) {
                                  Get.defaultDialog(
                                      backgroundColor:
                                          Themes.backGroundDialogColor,
                                      title: 'Error',
                                      content: Column(
                                        children: [
                                          usernameError != null
                                              ? Text(
                                                  '${usernameError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          emailError != null
                                              ? Text(
                                                  '${emailError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          phoneError != null
                                              ? Text(
                                                  '${phoneError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          passwordError != null
                                              ? Text(
                                                  '${passwordError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          confirmPasswordError != null
                                              ? Text(
                                                  '${confirmPasswordError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                        ],
                                      ));
                                } else {
                                  onClickRegister();
                                }
                              }
                              ,
                              text: 'Sign up',
                              borderRadiusCircular: 50,
                              width: 80.9.w,
                              height: 4.4.h,
                              fontSize: 16.sp,
                              fontType: 'Montaga',
                              fontWeight: '400',
                              lineHeight: 19.71,
                              borderColor: Themes.borderLogInButtonColor,
                              fontColor: Themes.darkGreenColor,
                              buttonColor: Themes.logInButtonColor,
                              hasColor: true)
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .slideX(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomMontagaText(
                              text: 'Already have an account ?',
                              size: 12.sp,
                              lineHeight: 14.58,
                              fontWeight: '500',
                              color: Themes.fontColor1,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: 2.h,
                            child: MaterialButton(
                              minWidth: 5.h,
                              height: 1.5.h,
                              onPressed: () {
                                buttonAudio("song_assets/bubble.mp3");
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: CustomMontagaText(
                                  text: 'Log in',
                                  size: 12.sp,
                                  lineHeight: 14.58,
                                  fontWeight: '500',
                                  color: Themes.darkGreenColor2,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: Themes.backgroundColorGradient,
              ),
              //color: Themes.BackgroundColor,
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.signupFormKey,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 13.1.w,
                      ),
                      Container(
                        width: 24.h,
                        height: 10.5.h,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1.5, color: Themes.fontColor1),
                          shape: BoxShape.circle,
                        ),
                        child: Obx(() => GestureDetector(
                              child: CircleAvatar(
                                backgroundColor:
                                    Colors.transparent.withOpacity(0),
                                radius: 5.25.h,
                                backgroundImage: controller.imagePath.value.isNotEmpty
                                    ? FileImage(File(controller.getStorage
                                        .read('profile image')))
                                    : null,
                                child: controller.imagePath.value.isNotEmpty
                                    ? null
                                    : SvgPicture.asset(
                                        'assets/images/camera.svg',
                                        color: Themes.fontColor1,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              onTap: () {
                                controller.getImage();
                              },
                            )),
                      ),
                      SizedBox(
                        height: 6.4.w,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          controller.userName = value;
                        },
                        isPassword: false,

                        controller: controller.userNameController,
                        textInputType: TextInputType.name,

                        labelText: 'Username',
                        hintText: 'Enter your name',
                        validate: controller.usernameValidator,
                        //  suffix_icon: Icons.cancel,
                        focusNode: controller.usernameFocusNode,
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .fadeIn(curve: Curves.easeOut)
                          .then()
                          .flip(),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          controller.email = value;
                        },
                        isPassword: false,

                        focusNode: controller.emailFocusNode,
                        controller: controller.emailController,
                        textInputType: TextInputType.emailAddress,

                        labelText: 'Email',
                        hintText: 'Enter your email',
                        //  validate: controller.emailValidator,
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Themes.iconColorAtTextFormField,
                        ),
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .fadeIn(curve: Curves.easeOut)
                          .then()
                          .flip(),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      CustomTextFormField(
                        onChange: (value) {
                          controller.mobileNumber = value;
                        },
                        isPassword: false,

                        focusNode: controller.mobileNumberFocusNode,
                        controller: controller.mobileNumberController,
                        textInputType: TextInputType.phone,

                        labelText: 'Mobile Number',
                        hintText: 'Enter your mobile phone',
                        validate: controller.mobilePhoneValidator,
                        //     suffix_icon: Icons.cancel,
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .fadeIn(curve: Curves.easeOut)
                          .then()
                          .flip(),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          onChange: (value) {
                            controller.password = value;
                          },
                          isPassword: controller.isPasswordHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              buttonAudio("song_assets/bubble.mp3");
                              controller.isPasswordHidden.value =
                                  !controller.isPasswordHidden.value;
                            },
                          ),

                          focusNode: controller.passwordFocusNode,
                          controller: controller.passwordController,
                          textInputType: TextInputType.visiblePassword,

                          labelText: 'Password',
                          hintText: 'Enter your password',
                          validate: controller.passwordValidator,
                          //    suffix_icon: Icons.visibility_off,
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                      ),
                      SizedBox(
                        height: 1.8.w,
                      ),
                      Obx(
                        () => CustomTextFormField(
                          onChange: (value) {
                            controller.confirmPassword = value;
                          },
                          isPassword: controller.isPasswordConfirmHidden.value,
                          suffixIcon: InkWell(
                            child: Icon(
                              controller.isPasswordConfirmHidden.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Themes.iconColorAtTextFormField,
                            ),
                            onTap: () {
                              buttonAudio("song_assets/bubble.mp3");
                              controller.isPasswordConfirmHidden.value =
                                  !controller.isPasswordConfirmHidden.value;
                            },
                          ),

                          focusNode: controller.confirmPasswordFocusNode,
                          controller: controller.confirmPasswordController,
                          textInputType: TextInputType.visiblePassword,

                          labelText: 'Confirm Password',
                          hintText: 'Enter your password',
                          validate: controller.confirmPasswordValidator,
                          //suffix_icon: Icons.visibility_off,
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      MaterialButton(
                        onPressed: () {
                          buttonAudio("song_assets/bubble.mp3");
                          controller.openFile();
                        },
                        height: 4.3.h,
                        minWidth: 43.h,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Themes.borderFieldColor, width: 1.0),
                        ),
                        color: Themes.dialogColor,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomMontagaText(
                                text: 'Certificate PDF file   ',
                                size: 14.sp,
                                lineHeight: 17.01,
                                fontWeight: '500',
                                color: Themes.fontColorAtTextFormField,
                                textAlign: TextAlign.center),
                            SvgPicture.asset(
                              'assets/images/up.svg',
                              color: Themes.iconColor,
                              height: 3.h,
                              width: 8.2.h,
                              fit: BoxFit.none,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .slideX(),
                      SizedBox(
                        height: 4.5.w,
                      ),
                      CustomTextButton(
                              onSubmit: () {
                                buttonAudio("song_assets/bubble.mp3");
                                String? emailError = controller.emailValidator(
                                    controller.emailController.text);
                                String? phoneError =
                                    controller.mobilePhoneValidator(
                                        controller.mobileNumberController.text);
                                String? usernameError =
                                    controller.usernameValidator(
                                        controller.userNameController.text);
                                String? passwordError =
                                    controller.passwordValidator(
                                        controller.passwordController.text);
                                String? confirmPasswordError = controller
                                    .confirmPasswordValidator(controller
                                        .confirmPasswordController.text);
                                if (emailError != null ||
                                    phoneError != null ||
                                    usernameError != null ||
                                    passwordError != null ||
                                    confirmPasswordError != null) {
                                  Get.defaultDialog(
                                      backgroundColor:
                                          Themes.backGroundDialogColor,
                                      title: 'Error',
                                      content: Column(
                                        children: [
                                          usernameError != null
                                              ? Text(
                                                  '${usernameError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          emailError != null
                                              ? Text(
                                                  '${emailError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          phoneError != null
                                              ? Text(
                                                  '${phoneError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          passwordError != null
                                              ? Text(
                                                  '${passwordError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                          confirmPasswordError != null
                                              ? Text(
                                                  '${confirmPasswordError}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        Themes.darkGreenColor,
                                                  ),
                                                )
                                              : const SizedBox(
                                                  height: 0,
                                                ),
                                        ],
                                      ));
                                } else {
                                  Get.toNamed(Routes.AUTHENTICATED);
                                }
                              }
                              ,
                              text: 'Sign up',
                              borderRadiusCircular: 50,
                              width: 80.9.h,
                              height: 4.4.h,
                              fontSize: 16.sp,
                              fontType: 'Montaga',
                              fontWeight: '400',
                              lineHeight: 19.71,
                              borderColor: Themes.borderLogInButtonColor,
                              fontColor: Themes.darkGreenColor,
                              buttonColor: Themes.logInButtonColor,
                              hasColor: true)
                          .animate()
                          .shimmer(duration: const Duration(seconds: 1))
                          .slideX(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomMontagaText(
                              text: 'Already have an account ?',
                              size: 12.sp,
                              lineHeight: 14.58,
                              fontWeight: '500',
                              color: Themes.fontColor1,
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: 2.5.h,
                            child: MaterialButton(
                              minWidth: 5.h,
                              height: 1.5.h,
                              onPressed: () {
                                buttonAudio("song_assets/bubble.mp3");
                                Get.offAllNamed(Routes.LOGIN);
                              },
                              child: CustomMontagaText(
                                  text: 'Log in',
                                  size: 12.sp,
                                  lineHeight: 14.58,
                                  fontWeight: '500',
                                  color: Themes.darkGreenColor2,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }


  void onClickRegister() async {
    EasyLoading.show(status: 'Loading....', dismissOnTap: true);

    bool registerSuccess = await controller.userRegister(
        name: controller.userName,
        email: controller.email,
        password: controller.password,
        passwordConfirmation: controller.confirmPassword,
        phoneNumber: controller.mobileNumber,
        imagePathing: controller.imagePathing,
        imageName: controller.imageName,
        filePath: controller.filePathing,
        fileName: controller.fileName
    );

    EasyLoading.dismiss(); // Dismiss the loading indicator

    if (registerSuccess) {
      controller.storage.save('email',controller.email);
      print('saved email is user storage');
      print(controller.storage.read('email'));
      buttonAudio("song_assets/bubble.mp3");


       Get.offAllNamed(Routes.AUTHENTICATED);


      EasyLoading.dismiss(); // Dismiss the loading indicator
    } else {
    //  EasyLoading.showError('Error', duration: const Duration(seconds: 3), dismissOnTap: true);
        Get.dialog(const WrongMessageDialog());
      print("*********** Error here ************");
    }
  }
}
