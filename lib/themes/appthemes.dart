import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // Color constants for light theme
  static const Color primaryColor = Color(0xFF003133);
  static const Color secondaryColor = Color(0xFF5D9380);
  static const Color textColor = Color(0xFF001919);
  static const Color whiteColor = Color(0xFFFFFFFF); //white color
  static const Color subTextColor = Color(0xFFD9D9D9); // Light grey for subtext
  static const Color ratingYellowColor = Color(
    0xFFFFCE31,
  ); // yellow for rating star
  static const Color borderColor = Color(0xFF212121); // Light grey for borders
  static const Color errorColor = Color(0xFFB00020); // Error color
  static const Color lightGreyColor = Color(0xffF0F0F0);
  // Label colors for light theme
  static const Color labelOrderPlaced = Color(0xFF6C757D);
  static const Color labelDriverEnRoute = Color(0xFF0D6EFD);
  static const Color labelInProcess = Color(0xFFFD7E14);
  static const Color labelClothesReady = Color(0xFFBEB808);
  static const Color labelDelivered = Color(0xFF6F42C1);
  static const Color yellowColor = Color(0xFFFBBA32);

  // Color constants for dark theme
  static const Color darkPrimaryColor = Color(
    0xFF5D9380,
  ); // Darker green for dark mode
  static const Color darkSecondaryColor = Color(
    0xFF5D9380,
  ); // Lighter purple for dark mode
  static const Color darkTextColor = Color(
    0xFFF5F5F5,
  ); // Light text for dark mode
  // Light text for dark mode
  static const Color darkBackgroundColor = Color(0xFF003133); // Dark background
  static const Color darkSurfaceColor = Color(0xFF001919); // Dark surface color
  static const Color darkSubTextColor =
      Colors.white; // Darker grey for subtext in dark mode

  // Light theme colors
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: whiteColor,
    colorScheme: const ColorScheme.light(
      primaryFixedDim: Color(0xff5D9380),
      primary: primaryColor,
      secondary: secondaryColor,
      surface: whiteColor,
      outline: yellowColor,
      error: errorColor,
      onPrimary: whiteColor,
      onSecondary: whiteColor,
      onSurface: textColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      iconTheme: const IconThemeData(color: textColor),
    ),
    textTheme: TextTheme(
      // 28sp - Largest headlines, onboarding main titles
      displayLarge: GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      // 26sp - Secondary headlines
      displayMedium: GoogleFonts.poppins(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      // 24sp - Tertiary headlines, success screen titles
      displaySmall: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      // 22sp - Section titles, important callouts
      headlineLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),

      // 20sp - Subsection titles, app bar titles
      headlineMedium: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      // 16sp - Standard title text, primary content
      titleLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
      // 16sp - Standard body text, regular weight
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      // 14sp - Secondary text, descriptions
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: textColor,
      ),
      // 12sp - Small text for captions, hints, etc.
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: textColor.withValues(alpha: 0.7),
      ),
    ),
    hintColor: textColor.withValues(alpha: 0.28),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: borderColor.withValues(alpha: 0.14)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: borderColor.withValues(alpha: 0.14)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: errorColor.withValues(alpha: 0.6)),
      ),
      hintStyle: GoogleFonts.poppins(
        fontSize: 13.sp,
        color: textColor.withValues(alpha: 0.6),
      ),
    ),
    dividerTheme: DividerThemeData(color: textColor, thickness: 1),
  );

  // Dark theme colors
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    scaffoldBackgroundColor: darkBackgroundColor,
    colorScheme: ColorScheme.dark(
      primary: darkPrimaryColor,
      secondary: darkSecondaryColor,
      outline: yellowColor,
      primaryFixedDim: const Color(0xFF1F4D33),
      surface: darkSurfaceColor,
      error: const Color(0xFFCF6679),
      onPrimary: whiteColor,
      onSecondary: whiteColor,
      onSurface: darkTextColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: darkSurfaceColor,
      elevation: 0,
      titleTextStyle: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      iconTheme: IconThemeData(color: darkTextColor),
    ),
    textTheme: TextTheme(
      // Title large for onboarding/success screens
      displayLarge: GoogleFonts.poppins(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      // 26sp - Secondary headlines
      displayMedium: GoogleFonts.poppins(
        fontSize: 26.sp,
        fontWeight: FontWeight.bold,
        color: darkTextColor,
      ),
      // 24sp - Tertiary headlines, success screen titles
      displaySmall: GoogleFonts.poppins(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      // 22sp - Section titles, important callouts
      headlineLarge: GoogleFonts.poppins(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),

      // 20sp - Subsection titles, app bar titles
      headlineMedium: GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: darkTextColor,
      ),
      // 16sp - Standard title text, primary content
      titleLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: darkTextColor,
      ),
      // 16sp - Standard body text, regular weight
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: darkTextColor,
      ),
      // 14sp - Secondary text, descriptions
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: darkTextColor,
      ),
      // 12sp - Small text for captions, hints, etc.
      bodySmall: GoogleFonts.poppins(
        fontSize: 12.sp,
        fontWeight: FontWeight.normal,
        color: darkTextColor.withValues(alpha: 0.7),
      ),
    ),
    hintColor: darkTextColor.withValues(alpha: 0.28),

    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: darkTextColor.withValues(alpha: 0.14)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: darkTextColor.withValues(alpha: 0.14)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(color: darkPrimaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Color(0xFFCF6679)),
      ),
      hintStyle: GoogleFonts.poppins(
        fontSize: 13.sp,
        color: darkTextColor.withValues(alpha: 0.5),
      ),
    ),
    dividerTheme: DividerThemeData(color: darkTextColor, thickness: 1),
  );
}
