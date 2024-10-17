import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  AppTextTheme();
  static TextTheme allTextTheme = TextTheme(
    //Title Text
    titleLarge: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
      fontSize: 23,
      fontWeight: FontWeight.bold,
    )),
    titleMedium: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    )),
    titleSmall: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
      fontSize: 19,
      fontWeight: FontWeight.w600,
    )),
    // Button Texts
    labelMedium: GoogleFonts.poppins(
      textStyle: const TextStyle().copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(0.7),
      ),
    ),
    labelLarge: GoogleFonts.poppins(
      textStyle: const TextStyle().copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    ),
    labelSmall: GoogleFonts.poppins(
      textStyle: const TextStyle().copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
      ),
    ),
    // Content Texts
    bodyMedium: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    )),
    bodySmall: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    )),
    //italian
    bodyLarge: GoogleFonts.poppins(
        textStyle: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: Colors.grey[600],
      fontStyle: FontStyle.italic,
    )),
  );
}
