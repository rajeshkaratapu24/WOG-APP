import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Define exact colors based on the image
  static const Color backgroundColor = Color(0xFF0F0F0F); // Very dark gray/black
  static const Color cardBackgroundColor = Color(0xFF1A1A1A); // Slightly lighter for card base if gradient fails
  static const Color bottomNavColor = Color(0xFF080808);
  static const Color textColorPrimary = Colors.white;
  static const Color textColorSecondary = Colors.white70;

  // Daily Verse Colors
  static const Color verseBlue = Color(0xFF0F1B63);
  
  // Notification Colors
  static const Color notifRed = Color(0xFF630F0F);

  // Live Colors
  static const Color liveGray = Color(0xFF2F363F);
  static const Color liveRedDot = Color(0xFFFF3B30);

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: textColorPrimary,
      
      // Setting up Telugu and English fonts
      textTheme: GoogleFonts.notoSansTeluguTextTheme(
        TextTheme(
          bodyLarge: const TextStyle(color: textColorPrimary),
          bodyMedium: const TextStyle(color: textColorSecondary),
          titleMedium: GoogleFonts.tenaliRamakrishna(textStyle: const TextStyle(color: textColorPrimary, fontSize: 24)), // Stylized Telugu
        ),
      ).copyWith(
        // Fallback for English text within Telugu context
        labelLarge: GoogleFonts.poppins(textStyle: const TextStyle(color: textColorPrimary, letterSpacing: 1.5)),
      ),
    );
  }
}
