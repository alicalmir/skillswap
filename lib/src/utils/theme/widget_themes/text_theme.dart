import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillswap/src/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  /** Light Text Theme */
  static TextTheme lightTextTheme = TextTheme(
      headline1: GoogleFonts.montserrat(
        color: tDarkColor,
        fontSize: 28,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.montserrat(
        color: tDarkColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headline3: GoogleFonts.poppins(
        color: tDarkColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      ),
      headline4: GoogleFonts.poppins(
        color: tDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      headline5: GoogleFonts.poppins(
        color: tDarkColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      headline6: GoogleFonts.poppins(
        color: tDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyText1: GoogleFonts.poppins(
        color: tDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: GoogleFonts.poppins(
        color: tDarkColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: GoogleFonts.poppins(color: Colors.black87, fontSize: 18));
  static TextTheme dartkTextTheme = TextTheme(
    headline1: GoogleFonts.montserrat(
      color: tWhiteColor,
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    headline2: GoogleFonts.montserrat(
      color: tWhiteColor,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline3: GoogleFonts.poppins(
      color: tWhiteColor,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    headline4: GoogleFonts.poppins(
      color: tWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    headline5: GoogleFonts.poppins(
      color: tWhiteColor,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    headline6: GoogleFonts.poppins(
      color: tWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyText1: GoogleFonts.poppins(
      color: tWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: GoogleFonts.poppins(
      color: tWhiteColor,
      fontSize: 14,
      fontWeight: FontWeight.bold,
    ),
  );
}
