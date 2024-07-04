import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/Authenticated/authenticated_controller.dart';
import '../../core/components/custom_input_box.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/functions/button_audio.dart';
import '../../core/functions/get_device_type.dart';
import '../../routes/app_routes.dart';
import '../../theme/themes.dart';
import '../LogIn/login_controller.dart';
import '../Success/success_bottom_sheet.dart';
import '../Success/success_controller.dart';
import '../WrongMessage/wrong_message_dialog.dart';

class AuthenticatedScreen extends GetView<AuthenticatedController> {
  const AuthenticatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return Scaffold(
      body: deviceOrientation == Orientation.portrait
          ? Container(
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 6.2.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: 15.h,
                        width: 66.6.w,
                        child: Image.asset(
                          'assets/images/image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 1.5.h,
                    ),
                    SizedBox(
                      height: 6.6.h,
                      child: CustomMontagaText(
                          text: 'Verification Code',
                          size: 24.sp,
                          lineHeight: 29.57,
                          fontWeight: '400',
                          color: Themes.darkGreenColor,
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 3.7.h,
                    ),
                    CustomMontagaText(
                        text:
                            'We have sent the verification code to \nyour email address',
                        size: 16.sp,
                        lineHeight: 19.71,
                        fontWeight: '400',
                        color: Colors.black,
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 7.6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInputBox(
                          controller: controller.txt1,
                          onChange: (value) {
                            if (value.length == 1) {
                              controller.fullFields += 1;
                              FocusScope.of(context).nextFocus();
                              if (controller.fullFields == 6) {
                                onClickVerifyEmail();
                              }
                            } else if (value.isEmpty) {
                              controller.fullFields -= 1;
                            }
                          },
                        )
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt2, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt3, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt4, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt5, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt6, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            // FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                      ],
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 15.w,
                        height: 3.8.h,
                        child: CustomMontagaText(
                            text:'${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                            size: 16.sp,
                            lineHeight: 2.42,
                            fontWeight: 'Cabin',
                            color: Themes.darkGreenColor,
                            textAlign: TextAlign.center),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.zero,
                      height: 5.6.h,
                      width: 23.w,
                      child: CustomTextButton(
                          borderColor: Themes.borderButtonColor,
                          onSubmit: () {
                            buttonAudio("song_assets/message1.mp3");
                            onClickResendCode();

                          },
                          width: 20.w,
                          height: 2.6.h,
                          text: 'Send again',
                          borderRadiusCircular: 0,
                          fontSize: 15.sp,
                          fontType: 'Cabin',
                          fontWeight: '400',
                          lineHeight: 22.9,
                          fontColor: Themes.darkGreenColor,
                          buttonColor: Themes.backgroundColor,
                          hasColor: false),
                    )
                        .animate()
                        .shimmer(duration: const Duration(seconds: 1))
                        .slideX(),

                    // SizedBox(
                    //   height: 6.6.h,
                    // ),
                  ],
                ),
              ),
            )
          : Container(
              decoration:
                  BoxDecoration(gradient: Themes.backgroundColorGradient),
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 1.2.w,
                    ),
                    Center(
                      child: SizedBox(
                        height: 23.w,
                        width: 47.w,
                        child: Image.asset(
                          'assets/images/image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.w,
                    ),
                    SizedBox(
                      height: 6.6.h,
                      child: CustomMontagaText(
                          text: 'Verification Code',
                          size: 24.sp,
                          lineHeight: 29.57,
                          fontWeight: '400',
                          color: Themes.darkGreenColor,
                          textAlign: TextAlign.left),
                    ),
                    SizedBox(
                      height: 3.7.w,
                    ),
                    CustomMontagaText(
                        text:
                            'We have sent the verification code to your email address',
                        size: 16.sp,
                        lineHeight: 19.71,
                        fontWeight: '400',
                        color: Colors.black,
                        textAlign: TextAlign.left),
                    SizedBox(
                      height: 7.6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInputBox(controller: controller.txt1, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt2, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt3, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt4, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt5, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;
                            FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                        CustomInputBox(controller: controller.txt6, onChange: (value) {
                          if (value.length == 1) {
                            controller.fullFields += 1;

                            // FocusScope.of(context).nextFocus();
                            if (controller.fullFields == 6) {
                              onClickVerifyEmail();
                            }
                          } else if (value.isEmpty) {
                            controller.fullFields -= 1;
                          }
                        },)
                            .animate()
                            .shimmer(duration: const Duration(seconds: 1))
                            .fadeIn(curve: Curves.easeOut)
                            .then()
                            .flip(),
                      ],
                    ),
                    SizedBox(
                      height: 3.w,
                    ),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 15.h,
                        height: 3.8.h,
                        child: CustomMontagaText(
                            text:'${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}',
                            size: 16.sp,
                            lineHeight: 2.42,
                            fontWeight: 'Cabin',
                            color: Themes.darkGreenColor,
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.zero,
                      height: 5.6.h,
                      width: 23.h,
                      child: CustomTextButton(
                          borderColor: Themes.borderButtonColor,
                          onSubmit: () {
                            buttonAudio("song_assets/message1.mp3");
                            Get.dialog(const WrongMessageDialog());
                          },
                          width: 20.h,
                          height: 2.6.h,
                          text: 'Send again',
                          borderRadiusCircular: 0,
                          fontSize: 15.sp,
                          fontType: 'Cabin',
                          fontWeight: '400',
                          lineHeight: 22.9,
                          fontColor: Themes.darkGreenColor,
                          buttonColor: Themes.backgroundColor,
                          hasColor: false),
                    )
                        .animate()
                        .shimmer(duration: const Duration(seconds: 1))
                        .slideX(),
                  ],
                ),
              ),
            ),
    );
  }

  void onClickVerifyEmail() async {
    EasyLoading.show(status: 'Loading....', dismissOnTap: true);

    bool verificationSuccess = await controller.userVerifyEmail();

    EasyLoading.dismiss(); // Dismiss the loading indicator

    if (verificationSuccess) {
      //login api call to save the token

      buttonAudio("song_assets/bubble.mp3");
      Get.toNamed(Routes.LOGIN);
      // buttonAudio("song_assets/tada.mp3");
      // Get.lazyPut(() => SuccessController());
      // Get.bottomSheet(
      //   const SuccessBottomSheet(),
      //   backgroundColor: Themes.backGroundDialogColor,
      // );
    } else {
      EasyLoading.showError('Error',
          duration: const Duration(seconds: 3), dismissOnTap: true);
      print("*********** Error here ************");
    }
  }

  void onClickResendCode() async {
    EasyLoading.show(status: 'Loading....', dismissOnTap: true);

    bool verificationSuccess = await controller.userResendCode();

    EasyLoading.dismiss(); // Dismiss the loading indicator

    if (verificationSuccess) {


      buttonAudio("song_assets/tada.mp3");
      Get.lazyPut(() => SuccessController());
      Get.bottomSheet(
        const SuccessBottomSheet(),
        backgroundColor: Themes.backGroundDialogColor,
      );
    } else {

        Get.dialog(const WrongMessageDialog());
      print("*********** Error here ************");
    }
  }
}
