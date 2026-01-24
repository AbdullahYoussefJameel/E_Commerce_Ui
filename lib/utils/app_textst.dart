import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextst {
  static TextStyle h1 = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );
  static TextStyle h2 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: -0.5,
  );
  static TextStyle h3 = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bodylarg = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle bodymedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
  );
  static TextStyle bodysmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle buttonlarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static TextStyle buttonmedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static TextStyle buttonsmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static TextStyle lablelarge = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );
  static TextStyle labelmedium = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );
  static TextStyle labelsmall = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  static TextStyle withWeight(TextStyle style, FontWeight weight) {
    return style.copyWith(fontWeight: weight);
  }
}
