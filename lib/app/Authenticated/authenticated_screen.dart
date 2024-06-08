import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/Authenticated/authenticated_controller.dart';
import '../../core/components/custom_input_box.dart';
import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';
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
                          line_height: 29.57,
                          font_weight: '400',
                          color: Themes.darkGreenColor),
                    ),
                    SizedBox(
                      height: 3.7.h,
                    ),
                    CustomMontagaText(
                        text:
                            'We have sent the verification code to \nyour email address',
                        size: 16.sp,
                        line_height: 19.71,
                        font_weight: '400',
                        color: Colors.black),
                    SizedBox(
                      height: 7.6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInputBox(controller: controller.txt1),
                        CustomInputBox(controller: controller.txt2),
                        CustomInputBox(controller: controller.txt3),
                        CustomInputBox(controller: controller.txt4),
                        CustomInputBox(controller: controller.txt5),
                        CustomInputBox(controller: controller.txt6),
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
                            text: '03:00',
                            size: 16.sp,
                            line_height: 2.42,
                            font_weight: 'Cabin',
                            color: Themes.darkGreenColor),
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.zero,
                      height: 5.6.h,
                      width: 23.w,
                      child: CustomTextButton(
                          border_color: Themes.borderButtonColor,
                          onSubmit: () {
                            Get.dialog(const WrongMessageDialog());
                          },
                          width: 20.w,
                          height: 2.6.h,
                          text: 'Send again',
                          border_radius_circular: 0,
                          font_size: 15.sp,
                          font_type: 'Cabin',
                          font_weight: '400',
                          line_height: 22.9,
                          font_color: Themes.darkGreenColor,
                          button_color: Themes.backgroundColor,
                          hasColor: false),
                    ),

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
                          line_height: 29.57,
                          font_weight: '400',
                          color: Themes.darkGreenColor),
                    ),
                    SizedBox(
                      height: 3.7.w,
                    ),
                    CustomMontagaText(
                        text:
                            'We have sent the verification code to your email address',
                        size: 16.sp,
                        line_height: 19.71,
                        font_weight: '400',
                        color: Colors.black),
                    SizedBox(
                      height: 7.6.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomInputBox(controller: controller.txt1),
                        CustomInputBox(controller: controller.txt2),
                        CustomInputBox(controller: controller.txt3),
                        CustomInputBox(controller: controller.txt4),
                        CustomInputBox(controller: controller.txt5),
                        CustomInputBox(controller: controller.txt6),
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
                            text: '03:00',
                            size: 16.sp,
                            line_height: 2.42,
                            font_weight: 'Cabin',
                            color: Themes.darkGreenColor),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.zero,
                      height: 5.6.h,
                      width: 23.h,
                      child: CustomTextButton(
                          border_color: Themes.borderButtonColor,
                          onSubmit: () {
                            Get.dialog(const WrongMessageDialog());
                          },
                          width: 20.h,
                          height: 2.6.h,
                          text: 'Send again',
                          border_radius_circular: 0,
                          font_size: 15.sp,
                          font_type: 'Cabin',
                          font_weight: '400',
                          line_height: 22.9,
                          font_color: Themes.darkGreenColor,
                          button_color: Themes.backgroundColor,
                          hasColor: false),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
