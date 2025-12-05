import 'package:flutter/material.dart';

/// {@template color_tokens}
/// Design system color tokens for the Stream Feeds sample app.
///
/// Contains the raw color palette that serves as the foundation for all theme colors.
/// Colors are organized by scale and purpose for consistent usage across light and dark themes.
/// {@endtemplate}
abstract class AppColorTokens {
  // region Blue Scale
  /// Blue color scale for primary brand colors
  static const blue50 = Color(0xffe9f2ff);
  static const blue500 = Color(0xff005FFF);
  static const blue600 = Color(0xff337eff);
  // endregion

  // region Gray Scale
  /// Gray color scale for neutral colors
  static const gray50 = Color(0xfff7f7f8);
  static const gray100 = Color(0xffecebeb);
  static const gray200 = Color(0xffdbdbdb);
  static const gray300 = Color(0xffe9eaed);
  static const gray500 = Color(0xff7a7a7a);
  static const gray700 = Color(0xff2d2f2f);
  static const gray800 = Color(0xff1c1e22);
  static const gray850 = Color(0xff121416);
  static const gray900 = Color(0xff13151b);
  static const gray950 = Color(0xff000000);
  // endregion

  // region Semantic Colors
  /// Red color scale for error states
  static const red500 = Color(0xffFF3842);
  static const red600 = Color(0xffFF3742);

  /// Green color scale for success states
  static const green500 = Color(0xff20E070);

  /// Orange color scale for warning states
  static const orange500 = Color(0xffFF6B35);
  static const orange600 = Color(0xffFF8555);

  /// Special colors for highlights and overlays
  static const yellow100 = Color(0xfffbf4dd);
  static const yellow800 = Color(0xff302d22);

  /// Blue dark variant for dark theme links
  static const blue900 = Color(0xff00193D);
  static const blue950 = Color(0xff141924);
  // endregion

  // region Pure Colors
  /// Pure black and white
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  // endregion

  // region Gradients
  /// Light theme background gradient
  static const lightGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xfff7f7f7), Color(0xfffcfcfc)],
    stops: [0, 1],
  );

  /// Dark theme background gradient
  static const darkGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xff101214), Color(0xff070a0d)],
    stops: [0, 1],
  );
  // endregion

  // region Alpha Colors
  /// Overlay colors with alpha
  static const blackAlpha20 = Color.fromRGBO(0, 0, 0, 0.2);
  static const blackAlpha40 = Color.fromRGBO(0, 0, 0, 0.4);
  static const blackAlpha60 = Color.fromRGBO(0, 0, 0, 0.6);
  static const blackAlpha80 = Color.fromRGBO(0, 0, 0, 0.08);
  static const blackAlpha100 = Color.fromRGBO(0, 0, 0, 1);

  static const whiteAlpha50 = Color.fromRGBO(255, 255, 255, 0.5);
  static const whiteAlpha60 = Color.fromRGBO(255, 255, 255, 0.6);
  // endregion
}
