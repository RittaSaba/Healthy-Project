import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/functions/get_device_type.dart';
import '../../theme/themes.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.isPassword,
    required this.labelText,
    required this.hintText,
    // VoidCallback onSubmit(String)?,
    // VoidCallback onChange(String)?,
    // InkWell? suffixPressed,
    this.validate,
    this.focusNode,
    this.suffixIcon,
  }) : super(key: key);
  final validate;
  FocusNode? focusNode;
  final TextEditingController controller;
  final TextInputType textInputType;
  final String labelText;
  final String hintText;
  final bool isPassword;
  Widget? suffixIcon;

  VoidCallback? onSubmit; //(String)
  VoidCallback? onChange; //(String)
  // InkWell? suffixPressed;

  @override
  Widget build(BuildContext context) {
    Orientation deviceOrientation =
        getScreenOrientation(MediaQuery.of(context));
    return deviceOrientation == Orientation.portrait
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Themes.fieldColor1,
            ),
            height: 5.9.h,
            width: 81.w,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.words,
              obscureText: isPassword,

              controller: controller,
              cursorColor: Themes.darkGreenColor2,
              keyboardType: textInputType,
              validator: validate,

//   onFieldSubmitted: onSubmit,
// onChanged: onChange,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Cabin',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Themes.darkGreenColor,
              ),

              decoration: InputDecoration(
                //contentPadding: EdgeInsets.all(15),
                //contentPadding: EdgeInsets.symmetric(vertical: 0.5.h ,horizontal:9.5.w),
                fillColor: Themes.fieldColor1,
                filled: true,
                focusColor: Colors.red,
                //suffixIconColor: Themes.IconColor,
                suffixIcon: suffixIcon,
                //  suffix:suffix_icon,
                // InkWell(child: suffix_icon != Icons.cancel ? Icon(suffix_icon) : null,onTap: (){}
                //
                //   ,),

                constraints: BoxConstraints(
                  maxWidth: 81.w,
                  maxHeight: 5.9.h,
                  minHeight: 4.9.h,
                ),
                //BoxConstraints(maxHeight: 4.8.h,minHeight: 4.7.h),
                //border properties
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Themes.borderFieldColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Themes.borderFieldColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                // errorBorder: OutlineInputBorder(
                //    gapPadding: 100,
                //   borderSide: BorderSide.none,
                //   // borderRadius: BorderRadius.circular(10.0),
                // ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                alignLabelWithHint: true,
                hintText: hintText,

                hintStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Themes.fontColorAtTextFormField,
                ),

                labelText: labelText,

                labelStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Themes.fontColorAtTextFormField,
                ),

                errorStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.w100,
                  fontSize: 5.sp,
                  color: Colors.redAccent,
                ),

                floatingLabelStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                  color: Themes.darkGreenColor,
                ),
              ),
            ),
          )
        : Container(
            // padding: EdgeInsets.symmetric(vertical: 0.9.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Themes.fieldColor1,
            ),
            height: 5.9.h,
            width: 81.h,
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              textCapitalization: TextCapitalization.words,
              obscureText: isPassword,

              controller: controller,
              cursorColor: Themes.darkGreenColor2,
              keyboardType: textInputType,
              validator: validate,

//   onFieldSubmitted: onSubmit,
// onChanged: onChange,
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Cabin',
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Themes.darkGreenColor,
              ),

              decoration: InputDecoration(
                //contentPadding: EdgeInsets.all(15),
                //contentPadding: EdgeInsets.symmetric(vertical: 0.5.h ,horizontal:9.5.w),
                fillColor: Themes.fieldColor1,
                filled: true,
                focusColor: Colors.red,
                //suffixIconColor: Themes.IconColor,
                suffixIcon: suffixIcon,
                //  suffix:suffix_icon,
                // InkWell(child: suffix_icon != Icons.cancel ? Icon(suffix_icon) : null,onTap: (){}
                //
                //   ,),

                constraints: BoxConstraints(
                  maxWidth: 81.h,
                  maxHeight: 5.9.w,
                  minHeight: 4.9.w,
                ),
                //BoxConstraints(maxHeight: 4.8.h,minHeight: 4.7.h),
                //border properties
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Themes.borderFieldColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Themes.borderFieldColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),

                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                // errorBorder: OutlineInputBorder(
                //    gapPadding: 100,
                //   borderSide: BorderSide.none,
                //   // borderRadius: BorderRadius.circular(10.0),
                // ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                alignLabelWithHint: true,
                hintText: hintText,

                hintStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Themes.fontColorAtTextFormField,
                ),

                labelText: labelText,

                labelStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Themes.fontColorAtTextFormField,
                ),

                errorStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.w100,
                  fontSize: 5.sp,
                  color: Colors.redAccent,
                ),

                floatingLabelStyle: GoogleFonts.getFont(
                  'Cabin',
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                  color: Themes.darkGreenColor,
                ),
              ),
            ),
          );
  }
}
