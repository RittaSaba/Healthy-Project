import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';

class WrongMessageDialog extends StatelessWidget {
  const WrongMessageDialog({Key? key}) : super(key: key);

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
                  width: 86.7.w,
                  height: 29.8.h,
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 0.35),
                  child: Image.asset(
                    'assets/images/ellipse_3.png',
                    width: 16.7.w,
                    height: 7.7.h,
                  ),
                ),
                Align(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 11.9.h,
                    ),
                    CustomMontagaText(
                        text: 'Oh no!',
                        size: 20.sp,
                        line_height: 19.44,
                        font_weight: '400',
                        color: Colors.black),
                    CustomMontagaText(
                        text: 'Something went wrong.',
                        size: 16.sp,
                        line_height: 19.71,
                        font_weight: '400',
                        color: Colors.black),
                    CustomMontagaText(
                        text: 'Please try again.',
                        size: 12.sp,
                        line_height: 14.78,
                        font_weight: '400',
                        color: Colors.black),
                    SizedBox(
                      height: 6.4.h,
                    ),
                    CustomTextButton(
                        onSubmit: Get.back,
                        border_color: Themes.borderButtonColor,
                        text: 'Try again',
                        border_radius_circular: 50.sp,
                        width: 28.7.w,
                        height: 3.2.h,
                        font_size: 12.sp,
                        font_type: 'Montaga',
                        font_weight: '400',
                        line_height: 14.78,
                        font_color: Themes.fontColor2,
                        button_color: Themes.buttonColor2,
                        hasColor: true),
                    SizedBox(
                      height: 4.1.h,
                    ),
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
                  width: 86.7.w,
                  height: 29.8.h,
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 0.15),
                  child: Image.asset(
                    'assets/images/ellipse_3.png',
                    width: 16.7.w,
                    height: 7.7.h,
                  ),
                ),
                Align(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 11.9.h,
                    ),
                    CustomMontagaText(
                        text: 'Oh no!',
                        size: 20.sp,
                        line_height: 19.44,
                        font_weight: '400',
                        color: Colors.black),
                    CustomMontagaText(
                        text: 'Something went wrong.',
                        size: 16.sp,
                        line_height: 19.71,
                        font_weight: '400',
                        color: Colors.black),
                    CustomMontagaText(
                        text: 'Please try again.',
                        size: 12.sp,
                        line_height: 14.78,
                        font_weight: '400',
                        color: Colors.black),
                    SizedBox(
                      height: 6.4.h,
                    ),
                    CustomTextButton(
                        onSubmit: Get.back,
                        border_color: Themes.borderButtonColor,
                        text: 'Try again',
                        border_radius_circular: 50.sp,
                        width: 28.7.w,
                        height: 3.2.h,
                        font_size: 12.sp,
                        font_type: 'Montaga',
                        font_weight: '400',
                        line_height: 14.78,
                        font_color: Themes.fontColor2,
                        button_color: Themes.buttonColor2,
                        hasColor: true),
                    SizedBox(
                      height: 4.1.h,
                    ),
                  ],
                )),
              ],
            ),
          );
  }
}
