import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/functions/button_audio.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';
import 'logout_controller.dart';

class LogOutDialog extends GetView<LogOutController> {
  const LogOutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return deviceOrientation == Orientation.portrait
        ? Align(
            child: Stack(
              //  fit: StackFit.loose,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Themes.backGroundDialogColor,
                  ),
                  //color: Themes.DialogColor,
                  width: 86.9.w,
                  height: 30.8.h,
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 0.36),
                  child: Image.asset(
                    'assets/images/log_out_12.png',
                    width: 17.6.w,
                    height: 8.h,
                  ),
                ),
                Align(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.6.h,
                    ),

                    CustomMontagaText(
                        text: 'Oh no! You’re leaving...\nAre you sure?',
                        size: 16.sp,
                        lineHeight: 19.44,
                        fontWeight: '500',
                        color: Themes.fontColor1,
                        textAlign: TextAlign.center),

                    SizedBox(
                      height: 2.4.h,
                    ),
                    CustomTextButton(
                            onSubmit: () {
                              buttonAudio("song_assets/bubble.mp3");
                            },
                            borderColor: Themes.logInButtonColor,
                            text: 'No',
                            borderRadiusCircular: 50.sp,
                            width: 28.8.w,
                            height: 3.2.h,
                            fontSize: 13.sp,
                            fontType: 'Montaga',
                            fontWeight: '400',
                            lineHeight: 16.02,
                            fontColor: Themes.fontColor1,
                            buttonColor: Themes.logInButtonColor,
                            hasColor: true)
                        .animate()
                        .shimmer(duration: const Duration(seconds: 1))
                        .slideX(),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    CustomTextButton(
                            onSubmit: () {
                              buttonAudio("song_assets/bubble.mp3");
                            },
                            borderColor: Themes.logInButtonColor,
                            text: 'Yes,Log Me out',
                            borderRadiusCircular: 50.sp,
                            width: 28.8.w,
                            height: 3.2.h,
                            fontSize: 12.sp,
                            fontType: 'Montaga',
                            fontWeight: '400',
                            lineHeight: 14.78,
                            fontColor: Themes.fontColor1,
                            buttonColor: Themes.logInButtonColor,
                            hasColor: true)
                        .animate()
                        .shimmer(duration: const Duration(seconds: 1))
                        .slideX(),
                    // SizedBox(
                    //   height: 5.4.h,
                    // ),
                  ],
                )),
              ],
            ),
          )
        : Align(
            child: Stack(
              //  fit: StackFit.loose,
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Themes.backGroundDialogColor,
                  ),
                  //color: Themes.DialogColor,
                  width: 86.9.w,
                  height: 30.8.h,
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 0.16),

                  // top: 0.h,
                  // left: 42.w,

                  child: Image.asset(
                    'assets/images/log_out_12.png',
                    width: 17.6.w,
                    height: 8.h,
                  ),
                ),
                Align(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.6.h,
                    ),

                    CustomMontagaText(
                        text: 'Oh no! You’re leaving...\nAre you sure?',
                        size: 16.sp,
                        lineHeight: 19.44,
                        fontWeight: '500',
                        color: Themes.fontColor1,
                        textAlign: TextAlign.center),

                    SizedBox(
                      height: 2.4.h,
                    ),
                    CustomTextButton(
                            onSubmit: () {
                              buttonAudio("song_assets/bubble.mp3");
                            },
                            borderColor: Themes.logInButtonColor,
                            text: 'No',
                            borderRadiusCircular: 50.sp,
                            width: 28.8.w,
                            height: 3.2.h,
                            fontSize: 13.sp,
                            fontType: 'Montaga',
                            fontWeight: '400',
                            lineHeight: 16.02,
                            fontColor: Themes.fontColor1,
                            buttonColor: Themes.logInButtonColor,
                            hasColor: true)
                        .animate()
                        .shimmer(duration: const Duration(seconds: 1))
                        .slideX(),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    CustomTextButton(
                            onSubmit: () {
                              buttonAudio("song_assets/bubble.mp3");
                            },
                            borderColor: Themes.logInButtonColor,
                            text: 'Yes,Log Me out',
                            borderRadiusCircular: 50.sp,
                            width: 28.8.w,
                            height: 3.2.h,
                            fontSize: 12.sp,
                            fontType: 'Montaga',
                            fontWeight: '400',
                            lineHeight: 14.78,
                            fontColor: Themes.fontColor1,
                            buttonColor: Themes.logInButtonColor,
                            hasColor: true)
                        .animate()
                        .shimmer(duration: const Duration(seconds: 1))
                        .slideX(),
                    // SizedBox(
                    //   height: 5.4.h,
                    // ),
                  ],
                )),
              ],
            ),
          );
  }
}
