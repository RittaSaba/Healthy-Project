
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/Fuls/fuls_dialog.dart';
import 'package:temp_task2/app/Success/success_bottom_sheet.dart';
import 'package:temp_task2/app/Success/success_controller.dart';
import 'package:temp_task2/routes/app_routes.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/components/custom_text_form_field.dart';
import '../../core/functions/button_audio.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';
import 'login_controller.dart';

class LogInScreen extends GetView<LoginController> {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return Scaffold(
      body: deviceOrientation == Orientation.portrait
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.signInFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 33.h,
                          width: 80.w,
                          child: Image.asset(
                            'assets/images/image.png',
                            fit: BoxFit.cover,
                            height: 35.h,
                            width: 75.w,
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          validate:(String) {},
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
                          height: 2.4.h,
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.mobileNumberController,
                          textInputType: TextInputType.phone,

                          labelText: 'Mobile Number',
                          hintText: 'Enter your mobile phone',
                          validate: (String) {},
                          //  suffix_icon: Icons.cancel,
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        SizedBox(
                          height: 2.4.h,
                        ),
                        Obx(
                          () => CustomTextFormField(
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
                            controller: controller.passwordController,
                            textInputType: TextInputType.visiblePassword,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            validate: (String) {},
                          )
                              .animate()
                              .shimmer(duration: const Duration(seconds: 1))
                              .fadeIn(curve: Curves.easeOut)
                              .then()
                              .flip(),
                        ),
                        SizedBox(
                          height: 2.4.h,
                        ),
                        Obx(
                          () => CustomTextButton(
                                  onSubmit: controller.rememberMe.value == false
                                      ? () {
                                          buttonAudio("song_assets/error1.mp3");
                                          Get.defaultDialog(
                                            backgroundColor:
                                                Themes.backGroundDialogColor,
                                            title: '',
                                            content: const FulsDialog(),
                                          );
                                        }
                                      : () {controller.login();
                                          buttonAudio("song_assets/tada.mp3");
                                          Get.lazyPut(
                                              () => SuccessController());
                                          Get.bottomSheet(
                                            backgroundColor:
                                                Themes.backGroundDialogColor,
                                            const SuccessBottomSheet(),
                                          );
                                        },
                                  text: 'Log in',
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
                        ),
                        SizedBox(
                          width: 80.9.w,
                          height: 4.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Obx(
                                      () => RoundCheckBox(
                                        size: 15.sp,
                                        uncheckedColor: Colors.white,
                                        checkedWidget: Icon(
                                          Icons.check,
                                          size: 12.sp,
                                          weight: 20.sp,
                                          color: Themes.rightIcon,
                                        ),
                                        checkedColor: Colors.white,
                                        isChecked: controller.rememberMe.value,
                                        onTap: (value) {
                                          buttonAudio("song_assets/bubble.mp3");
                                          controller.toggleRememberMe(value!);
                                        },
                                        border: Border.all(
                                          width: 1.5.sp,
                                          color: Themes.rightIcon,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 0.5.w,
                                    ),
                                    CustomMontagaText(
                                        text: 'Remember me',
                                        size: 13.sp,
                                        lineHeight: 16.02,
                                        fontWeight: '400',
                                        color: Themes.darkGreenColor,
                                        textAlign: TextAlign.left),
                                  ],
                                ),
                              ),
                              MaterialButton(
                                minWidth: 26.4.w,
                                height: 1.9.h,
                                onPressed: () {},
                                child: CustomCabinText(
                                    text: 'Forget Password?',
                                    size: 11.sp,
                                    lineHeight: 17.01,
                                    fontWeight: '400',
                                    color: Themes.darkGreenColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.8.h,
                        ),
                        CustomTextButton(
                                onSubmit: () {
                                  buttonAudio("song_assets/bubble.mp3");

                                  Get.toNamed(Routes.SIGNUP,
                                      arguments: Transition.downToUp);
                                },
                                text: 'Create new account',
                                borderRadiusCircular: 50,
                                width: 80.9.w,
                                height: 4.4.h,
                                fontSize: 16.sp,
                                fontType: 'Montaga',
                                fontWeight: '400',
                                lineHeight: 19.71,
                                borderColor: Themes.borderButtonColor,
                                fontColor: Themes.darkGreenColor,
                                buttonColor:
                                    Themes.createNewAccountButtonColor,
                                hasColor: true)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .slideX(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: controller.signInFormKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 80.w,
                          width: 33.h,
                          child: Image.asset(
                            'assets/images/image.png',
                            fit: BoxFit.cover,
                            height: 75.w,
                            width: 35.h,
                          ),
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.emailController,
                          textInputType: TextInputType.emailAddress,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          validate: (String) {},
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
                          height: 2.4.w,
                        ),
                        CustomTextFormField(
                          isPassword: false,
                          controller: controller.mobileNumberController,
                          textInputType: TextInputType.phone,

                          labelText: 'Mobile Number',
                          hintText: 'Enter your mobile phone',
                          validate: (String) {},
                          //  suffix_icon: Icons.cancel,
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        SizedBox(
                          height: 2.4.w,
                        ),
                        Obx(
                          () => CustomTextFormField(
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
                            controller: controller.passwordController,
                            textInputType: TextInputType.visiblePassword,

                            labelText: 'Password',
                            hintText: 'Enter your password',
                            validate: (String) {},

                          )
                              .animate()
                              .shimmer(duration: const Duration(seconds: 1))
                              .fadeIn(curve: Curves.easeOut)
                              .then()
                              .flip(),
                        ),
                        SizedBox(
                          height: 2.4.w,
                        ),
                        Obx(
                          () => CustomTextButton(
                                  onSubmit: controller.rememberMe.value == false
                                      ? () {
                                          buttonAudio("song_assets/error1.mp3");
                                          Get.defaultDialog(
                                            backgroundColor:
                                                Themes.backGroundDialogColor,
                                            title: '',
                                            content: const FulsDialog(),
                                          );
                                        }
                                      : () {
                                          buttonAudio("song_assets/tada.mp3");
                                          Get.lazyPut(
                                              () => SuccessController());
                                          Get.bottomSheet(
                                            backgroundColor:
                                                Themes.backGroundDialogColor,
                                            const SuccessBottomSheet(),
                                          );
                                        },
                                  text: 'Log in',
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
                        ),
                        SizedBox(
                          width: 80.9.h,
                          height: 4.w,
                          // margin: EdgeInsets.fromLTRB(16.5, 0, 0, 135),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Obx(
                                    () => RoundCheckBox(
                                      size: 15.sp,
                                      uncheckedColor: Colors.white,
                                      checkedWidget: Icon(
                                        Icons.check,
                                        size: 12.sp,
                                        weight: 20.sp,
                                        color: Themes.rightIcon,
                                      ),
                                      checkedColor: Colors.white,
                                      isChecked: controller.rememberMe.value,
                                      onTap: (value) {
                                        buttonAudio("song_assets/bubble.mp3");
                                        controller.toggleRememberMe(value!);
                                      },
                                      border: Border.all(
                                        width: 1.5.sp,
                                        color: Themes.rightIcon,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 0.5.h,
                                  ),
                                  CustomMontagaText(
                                      text: 'Remember me',
                                      size: 13.sp,
                                      lineHeight: 16.02,
                                      fontWeight: '400',
                                      color: Themes.darkGreenColor,
                                      textAlign: TextAlign.left),
                                ],
                              ),
                              MaterialButton(
                                minWidth: 26.4.h,
                                height: 1.9.w,
                                onPressed: () {},
                                child: CustomCabinText(
                                    text: 'Forget Password?',
                                    size: 11.sp,
                                    lineHeight: 17.01,
                                    fontWeight: '400',
                                    color: Themes.darkGreenColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.8.w,
                        ),
                        CustomTextButton(
                                onSubmit: () {
                                  buttonAudio("song_assets/bubble.mp3");
                                  Get.toNamed(Routes.SIGNUP);
                                },
                                text: 'Create new account',
                                borderRadiusCircular: 50,
                                width: 80.9.h,
                                height: 4.4.h,
                                fontSize: 16.sp,
                                fontType: 'Montaga',
                                fontWeight: '400',
                                lineHeight: 19.71,
                                borderColor: Themes.borderButtonColor,
                                fontColor: Themes.darkGreenColor,
                                buttonColor:
                                    Themes.createNewAccountButtonColor,
                                hasColor: true)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .slideX(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}

