import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomCabinText extends StatelessWidget {
  const CustomCabinText(
      {required this.text,
      required this.size,
      required this.line_height,
      required this.font_weight,
      required this.color,
      Key? key})
      : super(key: key);
  final String text;
  final double size;
  final double line_height;
  final String font_weight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        'Cabin',
        fontWeight: font_weight == '500' ? FontWeight.w500 : FontWeight.w400,
        fontSize: size,
        color: color,
        // height: line_height,
      ),
    );
  }
}

class CustomMontagaText extends StatelessWidget {
  const CustomMontagaText(
      {required this.text,
      required this.size,
      required this.line_height,
      required this.font_weight,
      required this.color,
      Key? key})
      : super(key: key);
  final String text;
  final double size;
  final double line_height;
  final String font_weight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.getFont(
        'Montaga',
        fontWeight: font_weight == '500' ? FontWeight.w500 : FontWeight.w400,
        fontSize: size,

        color: color,
        // height: line_height,
      ),
    );
  }
}
