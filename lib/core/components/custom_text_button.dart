import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {required this.text,
      required this.borderRadiusCircular,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.fontType,
      required this.fontWeight,
      required this.lineHeight,
      required this.fontColor,
      required this.buttonColor,
      required this.hasColor,
      this.borderColor,
      this.onSubmit,
      Key? key})
      : super(key: key);
  final String text;
  final double borderRadiusCircular;
  final double width;
  final double height;
  final double fontSize;
  final String fontType;
  final String fontWeight;
  final double lineHeight;
  final Color fontColor;
  final Color buttonColor;
  Color? borderColor = Themes.borderButtonColor;
  final bool hasColor;
  Function()? onSubmit;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onSubmit,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: hasColor == true
              ? Border.all(color: borderColor as Color)
              : null,
          borderRadius: BorderRadius.circular(borderRadiusCircular),
          color: hasColor == true ? buttonColor : null,
        ),
        child: Center(
          child: fontType == 'Cabin'
              ? CustomCabinText(
                  text: text,
                  size: fontSize,
                  lineHeight: lineHeight,
                  fontWeight: fontWeight,
                  color: Themes.fontColor1)
              : CustomMontagaText(
                  text: text,
                  size: fontSize,
                  lineHeight: lineHeight,
                  fontWeight: fontWeight,
                  color: fontColor,
                  textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
