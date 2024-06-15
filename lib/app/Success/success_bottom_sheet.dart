
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:sizer/sizer.dart';
import 'package:temp_task2/app/LogOut/logout_dialog.dart';
import 'package:temp_task2/app/Success/success_controller.dart';

import '../../core/components/custom_text.dart';
import '../../core/components/custom_text_button.dart';
import '../../core/functions/button_audio.dart';
import '../../core/functions/get_confetti_widget.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';

class SuccessBottomSheet extends GetView<SuccessController> {
  const SuccessBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return deviceOrientation == Orientation.portrait
        ? SizedBox(
            height: 44.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.5.h,
                ),
                GetConfettiWidget(
                  confettiController: controller.confettiController,
                ),
                SvgPicture.asset(
                  'assets/images/right.svg',
                  height: 12.4.h,
                  width: 26.9.w,
                ),
                SizedBox(height: 1.5.h),
                SizedBox(
                  height: 3.5.h, //width: 20.6,
                  child: GradientText(
                    'Success!',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
                    gradientType: GradientType.linear,
                    radius: 2.5,
                    colors: const [
                      Color.fromRGBO(182, 229, 185, 1),
                      Color.fromRGBO(101, 127, 103, 1),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                CustomCabinText(
                    text:
                        'Congratulations! You have been \nsuccessfully authenticated',
                    size: 18.sp,
                    fontWeight: '500',
                    lineHeight: 2.8.h,
                    color: Themes.lightGreyColor),
                SizedBox(
                  height: 3.7.h,
                ),
                CustomTextButton(
                  onSubmit: () {
                    buttonAudio("song_assets/message1.mp3");
                    Get.dialog(const LogOutDialog()); //(0.5, 0.36);
                  },
                  borderColor: Themes.borderButtonColor,
                  text: 'Continue',
                  borderRadiusCircular: 50,
                  width: 42.7.w,
                  height: 3.8.h,
                  fontSize: 16.sp,
                  fontType: 'Montaga',
                  fontWeight: '400',
                  lineHeight: 19.71,
                  fontColor: Themes.darkGreenColor,
                  buttonColor: Themes.successButtonColor,
                  hasColor: true,
                )
                    .animate()
                    .shimmer(duration: const Duration(seconds: 1))
                    .slideX(),
              ],
            ),
          )
        : SizedBox(
            height: 44.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.5.w,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GetConfettiWidget(
                        confettiController: controller.confettiController,
                      ),
                      SvgPicture.asset(
                        'assets/images/right.svg',
                        height: 12.4.w,
                        width: 26.9.w,
                      ),
                    ]),
                SizedBox(height: 1.5.w),
                SizedBox(
                  height: 3.5.h, //width: 20.6,
                  child: GradientText(
                    'Success!',
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
                    gradientType: GradientType.linear,
                    radius: 2.5,
                    colors: const [
                      Color.fromRGBO(182, 229, 185, 1),
                      Color.fromRGBO(101, 127, 103, 1),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.5.w,
                ),
                CustomCabinText(
                    text:
                        'Congratulations! You have been successfully authenticated',
                    size: 18.sp,
                    fontWeight: '500',
                    lineHeight: 2.8.h,
                    color: Themes.lightGreyColor),
                SizedBox(
                  height: 3.7.w,
                ),
                CustomTextButton(
                  onSubmit: () {
                    buttonAudio("song_assets/message1.mp3");
                    Get.dialog(const LogOutDialog());
                  },
                  borderColor: Themes.borderButtonColor,
                  text: 'Continue',
                  borderRadiusCircular: 50,
                  width: 42.7.h,
                  height: 3.8.h,
                  fontSize: 16.sp,
                  fontType: 'Montaga',
                  fontWeight: '400',
                  lineHeight: 19.71,
                  fontColor: Themes.darkGreenColor,
                  buttonColor: Themes.successButtonColor,
                  hasColor: true,
                )
                    .animate()
                    .shimmer(duration: const Duration(seconds: 1))
                    .slideX(),
              ],
            ),
          );
  }
}
