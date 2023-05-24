import 'package:flutter/material.dart';

var themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
    elevation: 0,
    centerTitle: false,
  ),
  scaffoldBackgroundColor: appColorBackground,
  brightness: Brightness.light,
  inputDecorationTheme: const InputDecorationTheme(
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: appColorLighterGray,
        width: 2,
      ),
    ),
    hintStyle: TextStyle(
      color: Color(0xffc0c1c3),
      fontFamily: appMainFontFamily,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
  ),
);

// Fonts:
const String appMainFontFamily = "Poppins"; //DMSans

// Colors:
const Color appColorBackground = Colors.white;
const Color appColorBlack = Color(0xff323335);
const Color appColorWhite = Colors.white;
const Color appColorTextGray = Color.fromRGBO(255, 255, 255, 1);
const Color appColorLightGray = Color(0xffc0c1c3);
const Color appColorLighterGray = Color(0xffe0e0e0);
const Color appColorSelect = Color(0xfffdc912);
const Color appColorRed = Color(0xfff36b6b);

class CommonText extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final FontWeight fontWeight;
  final double size;

  const CommonText({
    Key? key,
    required this.text,
    this.color = appColorBlack,
    this.height = 1.3,
    this.fontWeight = FontWeight.w400,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        height: height,
        fontWeight: fontWeight,
        fontSize: size,
        fontFamily: appMainFontFamily,
      ),
    );
  }
}
