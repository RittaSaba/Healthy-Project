import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../core/components/custom_text.dart';
import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';

class FulsDialog extends StatelessWidget {
  const FulsDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return deviceOrientation == Orientation.portrait
        ? SizedBox(
            width: 86.7.w,
            height: 29.8.h,
            child: Container(
              color: Themes.backGroundDialogColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/smile.svg',
                    color: Themes.fontColor1,
                    height: 5.7.h,
                    width: 13.9.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 3.7.h,
                  ),
                  CustomMontagaText(
                      text: 'Sorry!',
                      size: 32.sp,
                      fontWeight: '500',
                      lineHeight: 4.5.h,
                      color: Themes.fontColor1,
                      textAlign: TextAlign.center),
                  CustomMontagaText(
                      text: 'Incorrect password or email',
                      size: 20.sp,
                      fontWeight: '500',
                      lineHeight: 2.8.h,
                      color: Themes.fontColor1,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          )
        : SizedBox(
            width: 86.7.w,
            height: 20.8.h,
            //width: double.infinity,
            child: Container(
              color: Themes.backGroundDialogColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/smile.svg',
                    color: Themes.fontColor1,
                    height: 5.7.h,
                    width: 13.9.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 3.7.h,
                  ),
                  CustomMontagaText(
                      text: 'Sorry!',
                      size: 32.sp,
                      fontWeight: '500',
                      lineHeight: 4.5.h,
                      color: Themes.fontColor1,
                      textAlign: TextAlign.center),
                  CustomMontagaText(
                      text: 'Incorrect password or email',
                      size: 20.sp,
                      fontWeight: '500',
                      lineHeight: 2.8.h,
                      color: Themes.fontColor1,
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          );
  }
}
