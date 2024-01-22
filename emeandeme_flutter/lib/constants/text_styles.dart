import 'package:emeandeme/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

final class TextStyles {
  static const headerStyle = TextStyle(
    fontSize: 23.5,
    color: Colors.white,
    fontFamily: FontFamily.belleza,
  );
  static const headerTitleStyle = TextStyle(
    fontSize: 20.5,
    color: Color(0xFFdfc8c8),
    fontFamily: FontFamily.belleza,
  );
  static const dateTitles = TextStyle(
    fontSize: 37.5,
    color: Colors.black,
    fontFamily: FontFamily.belleza,
  );
  static const date = TextStyle(
    fontSize: 108,
    color: Color(0xFF929c89),
    fontFamily: FontFamily.notoSerif,
    fontWeight: FontWeight.w700,
  );
  static const dateButton = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: FontFamily.belleza,
  );
}

final class WelcomeSectionTextStyle {
  static const title = TextStyle(
    fontSize: 27,
    color: Color(0xFFdfc8c8),
    fontFamily: FontFamily.now,
    fontWeight: FontWeight.bold,
  );
  static const descriptions = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontFamily: FontFamily.belleza,
  );
  static const subTitle = TextStyle(
    fontSize: 17,
    color: Color(0xFFdfc8c8),
    fontFamily: FontFamily.now,
    fontWeight: FontWeight.bold,
  );
}

final class TimmingTextStyle {
  static const title = TextStyle(
    fontSize: 49.8,
    color: Color(0xFF929c89),
    fontFamily: FontFamily.notoSerif,
    fontWeight: FontWeight.w700,
  );
}

final class LodgingsTextStyle {
  static const title = TextStyle(
    fontSize: 36,
    color: Color(0xFFdfc8c8),
    fontFamily: FontFamily.notoSerif,
    fontWeight: FontWeight.w700,
  );

  static const name = TextStyle(
    fontSize: 21,
    color: Colors.white,
    fontFamily: FontFamily.notoSerif,
    fontWeight: FontWeight.w700,
  );
  static const descriptions = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: FontFamily.belleza,
  );
}
