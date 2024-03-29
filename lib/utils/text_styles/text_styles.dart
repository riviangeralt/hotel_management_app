import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle applyTextStyles({required TextStyle styles}) {
    return GoogleFonts.outfit(
      textStyle: styles,
    );
  }
}
