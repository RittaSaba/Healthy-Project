import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
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
                        line_height: 19.44,
                        font_weight: '500',
                        color: Themes.fontColor1),

                    SizedBox(
                      height: 2.4.h,
                    ),
                    CustomTextButton(
                        border_color: Themes.logInButtonColor,
                        text: 'No',
                        border_radius_circular: 50.sp,
                        width: 28.8.w,
                        height: 3.2.h,
                        font_size: 13.sp,
                        font_type: 'Montaga',
                        font_weight: '400',
                        line_height: 16.02,
                        font_color: Themes.fontColor1,
                        button_color: Themes.logInButtonColor,
                        hasColor: true),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    CustomTextButton(
                        border_color: Themes.logInButtonColor,
                        text: 'Yes,Log Me out',
                        border_radius_circular: 50.sp,
                        width: 28.8.w,
                        height: 3.2.h,
                        font_size: 12.sp,
                        font_type: 'Montaga',
                        font_weight: '400',
                        line_height: 14.78,
                        font_color: Themes.fontColor1,
                        button_color: Themes.logInButtonColor,
                        hasColor: true),
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
                        line_height: 19.44,
                        font_weight: '500',
                        color: Themes.fontColor1),

                    SizedBox(
                      height: 2.4.h,
                    ),
                    CustomTextButton(
                        border_color: Themes.logInButtonColor,
                        text: 'No',
                        border_radius_circular: 50.sp,
                        width: 28.8.w,
                        height: 3.2.h,
                        font_size: 13.sp,
                        font_type: 'Montaga',
                        font_weight: '400',
                        line_height: 16.02,
                        font_color: Themes.fontColor1,
                        button_color: Themes.logInButtonColor,
                        hasColor: true),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    CustomTextButton(
                        border_color: Themes.logInButtonColor,
                        text: 'Yes,Log Me out',
                        border_radius_circular: 50.sp,
                        width: 28.8.w,
                        height: 3.2.h,
                        font_size: 12.sp,
                        font_type: 'Montaga',
                        font_weight: '400',
                        line_height: 14.78,
                        font_color: Themes.fontColor1,
                        button_color: Themes.logInButtonColor,
                        hasColor: true),
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