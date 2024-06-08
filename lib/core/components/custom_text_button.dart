import 'package:flutter/material.dart';
import '../../theme/themes.dart';
import 'custom_text.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton(
      {required this.text,
      required this.border_radius_circular,
      required this.width,
      required this.height,
      required this.font_size,
      required this.font_type,
      required this.font_weight,
      required this.line_height,
      required this.font_color,
      required this.button_color,
      required this.hasColor,
      this.border_color,
     this.onSubmit,
      Key? key})
      : super(key: key);
  final String text;
  final double border_radius_circular;
  final double width;
  final double height;
  final double font_size;
  final String font_type;
  final String font_weight;
  final double line_height;
  final Color font_color;
  final Color button_color;
   Color? border_color=Themes.borderButtonColor;
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
              ? Border.all(color: border_color as Color)
              : null,
          borderRadius: BorderRadius.circular(border_radius_circular),
          color: hasColor == true ? button_color : null,
        ),
        child: Center(
          child: font_type == 'Cabin'
          ? CustomCabinText(
              text: text,
              size: font_size,
              line_height: line_height,
              font_weight: font_weight,
              color: Themes.fontColor1)
          : CustomMontagaText(
              text: text,
              size: font_size,
              line_height: line_height,
              font_weight: font_weight,
              color: font_color),
        ),
      ),
    );
  }
}
