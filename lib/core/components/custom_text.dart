import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCabinText extends StatelessWidget {
  const CustomCabinText(
      {required this.text,
      required this.size,
      required this.lineHeight,
      required this.fontWeight,
      required this.color,
      Key? key})
      : super(key: key);
  final String text;
  final double size;
  final double lineHeight;
  final String fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        'Cabin',
        fontWeight: fontWeight == '500' ? FontWeight.w500 : FontWeight.w400,
        fontSize: size,
        color: color,
        // height: line_height,
      ),
    );
  }
}

class CustomMontagaText extends StatelessWidget {
  const CustomMontagaText({
    required this.text,
    required this.size,
    required this.lineHeight,
    required this.fontWeight,
    required this.color,
    required this.textAlign,
    Key? key,
  }) : super(key: key);
  final String text;
  final double size;
  final double lineHeight;
  final String fontWeight;
  final Color color;
  final textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.getFont(
        'Montaga',
        fontWeight: fontWeight == '500' ? FontWeight.w500 : FontWeight.w400,
        fontSize: size,

        color: color,
        // height: line_height,
      ),
    );
  }
}
