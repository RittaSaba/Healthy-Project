import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';

class CustomInputBox extends StatelessWidget {
  const CustomInputBox({required this.controller, Key? key}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return deviceOrientation == Orientation.portrait
        ? Container(
            height: 4.5.h,
            width: 10.6.w,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.8,
                color: Themes.greyColor,
              ),
              color: Themes.fieldColor1,
              shape: BoxShape.circle,
            ),
            child: TextField(
              cursorColor: Themes.darkGreenColor2,
              controller: controller,
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Themes.greyColor,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                fillColor: Themes.fieldColor1, //Themes.DialogColor,
                border: const OutlineInputBorder(borderSide: BorderSide.none),

                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),

                counterText: '',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          )
        : Container(
            height: 4.5.h,
            width: 10.6.h,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.8,
                color: Themes.greyColor,
              ),
              color: Themes.fieldColor1,
              shape: BoxShape.circle,
            ),
            child: TextField(
              // cursorRadius: Radius.circular(100),
              cursorColor: Themes.darkGreenColor2,
              controller: controller,
              maxLength: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Themes.greyColor,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                fillColor: Themes.fieldColor1, //Themes.DialogColor,
                border: const OutlineInputBorder(borderSide: BorderSide.none),

                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),

                counterText: '',
              ),
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          );
  }
}
