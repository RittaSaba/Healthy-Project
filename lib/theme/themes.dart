import 'package:flutter/material.dart';

class Themes {
  //Font Colors
  static Color fontColorAtTextFormField =
      const Color.fromRGBO(163, 197, 176, 1);
  static Color fontColor1 = const Color.fromRGBO(3, 80, 20, 1);
  static Color fontColor2 = const Color.fromRGBO(255, 253, 253, 1);

  //Button Colors
  static Color buttonColor = const Color(0xFFB6E5B9);
  static Color buttonColor2 = const Color.fromRGBO(16, 52, 18, 1);
  static Color logInButtonColor = const Color.fromRGBO(182, 229, 185, 1);
  static Color successButtonColor = const Color.fromRGBO(182, 229, 185, 1);
  static Color createNewAccountButtonColor =
      const Color.fromRGBO(182, 229, 185, 0.3);

  //Border Colors
  static Color borderButtonColor = const Color.fromRGBO(163, 197, 176, 1);
  static Color borderFieldColor = const Color.fromRGBO(215, 221, 219, 1);
  static Color borderColor = const Color.fromRGBO(215, 221, 219, 1);
  static Color borderLogInButtonColor = const Color.fromRGBO(151, 191, 160, 1);

  //BackGround Colors
  static Color backGroundDialogColor = const Color.fromRGBO(255, 253, 253, 1);
  static Color backgroundColor = const Color.fromRGBO(172, 225, 175, 1);
  static LinearGradient backgroundColorGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(242, 255, 243, 0.5),
      Color.fromRGBO(182, 229, 185, 0.5),
    ],
  );

  //Field Colors
  static Color fieldColor1 = const Color.fromRGBO(215, 221, 219, 1);

  //Green Colors
  static Color darkGreenColor = const Color.fromRGBO(3, 80, 20, 1);
  static Color darkGreenColor1 = const Color.fromRGBO(86, 127, 5, 1);
  static Color darkGreenColor2 = const Color.fromRGBO(116, 167, 26, 1);

  //Grey Colors
  static Color lightGreyColor = const Color.fromRGBO(182, 182, 182, 1);
  static Color greyColor = const Color.fromRGBO(117, 117, 117, 1);

  //Icon Colors
  static Color iconColor = const Color.fromRGBO(151, 191, 160, 1);

  static Color rightIcon = const Color.fromRGBO(3, 80, 20, 0.6);
  static Color iconColorAtTextFormField =
      const Color.fromRGBO(163, 197, 176, 1);

  //Dialog Colors
  static Color dialogColor = const Color.fromRGBO(215, 221, 219, 1);

  late Orientation screenOrientation;

  static ThemeData customLightTheme = ThemeData.light().copyWith(
    inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(
          color: darkGreenColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: dialogColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: dialogColor),
            borderRadius: BorderRadius.circular(10))),
    backgroundColor: Colors.deepPurple,
    buttonColor: Colors.green,
  );
}
