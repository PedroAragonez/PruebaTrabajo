// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

abstract class ThemePA {
  static ThemePA of(BuildContext context) => LightModeTheme();

  Color ? primaryColor;
  Color ? secondaryColor;
  Color ? tertiaryColor;
  Color ? alternate;
  Color ? primaryBackground;
  Color ? secondaryBackground;
  Color ? primaryText;
  Color ? secondaryText;

  Color ? background;
  Color ? darkBackground;
  Color ? textColor;
  Color ? grayDark;
  Color ? grayLight;

  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: grayDark,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: MyColors.yellow01,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: grayLight,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Lexend Deca',
        color: grayDark,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Lexend Deca',
        color: textColor,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

class LightModeTheme extends ThemePA {
  Color ? primaryColor = const Color(0xFFC2C2C2);
  Color ? secondaryColor = const Color(0xFF989898);
  Color ? tertiaryColor = const Color(0xFFE4FFEA);
  Color ? alternate = const Color(0x00000000);
  Color ? primaryBackground = const Color(0x00000000);
  Color ? secondaryBackground = const Color(0x00000000);
  Color ? primaryText = const Color(0x00000000);
  Color ? secondaryText = const Color(0x00000000);

  Color ? background = Color(0xFFFFFFFF);
  Color ? darkBackground = Color(0xFFE4FFEA);
  Color ? textColor = Color(0xFFFFFFFF);
  Color ? grayDark = Color(0xFF101010);
  Color ? grayLight = Color(0x7B1E1E1E);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String ? fontFamily,
    Color ? color,
    double ? fontSize,
    FontWeight ? fontWeight,
    FontStyle ? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration ? decoration,
    double ? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}
