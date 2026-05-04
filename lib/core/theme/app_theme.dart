import 'package:flutter/material.dart';

class AppTheme {
  // تم دارک شما (برای ارجاع)
  static ThemeData get darkTheme => ThemeData(
    fontFamily: 'IranSans',
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Colors.deepOrange,
      secondary: Colors.amber,
      surface: Color(0xFF1A1A1A),
      onSurface: Colors.white70,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A1A),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white70,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF2D2D2D),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
      ),
    ),
  );

  // تم لایت پیشنهادی
  static ThemeData get lightTheme => ThemeData(
    fontFamily: 'IranSans',
    // فونت مورد نظر شما
    scaffoldBackgroundColor: Color(0xFFEFEFEF),
    // پس‌زمینه سفید تمیز
    colorScheme: ColorScheme.light(
      primary: Color(0xFF143A62),
      // رنگ اصلی کمی روشن‌تر از دارک
      onPrimary: Colors.white,
      // متن روی رنگ اصلی
      secondary: Colors.amber.shade400,
      // رنگ ثانویه روشن
      onSecondary: Colors.black87,
      // متن روی رنگ ثانویه
      surface: Colors.grey.shade200,
      // رنگ سطح (مثل کارت‌ها)
      onSurface: Colors.black87,
      // متن روی رنگ سطح
      background: Colors.white,
      // رنگ پس‌زمینه کلی (برای Scaffold)
      onBackground: Colors.black87,
      // متن روی پس‌زمینه
      error: Colors.red.shade700,
      // رنگ خطا
      onError: Colors.white, // متن روی رنگ خطا
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      // پس‌زمینه سفید برای AppBar
      titleTextStyle: TextStyle(
        fontFamily: 'IranSans',
        color: Colors.black87, // رنگ متن عنوان AppBar
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 1,
      // اضافه کردن سایه کم برای تفکیک بهتر
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black87), // رنگ آیکون‌های AppBar
    ),
    textTheme: const TextTheme(
      // تیترهای بزرگ با رنگ تیره خواناتر
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
      // متن‌های بدنه با رنگ تیره
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      // می‌توانید بقیه استایل‌های متن را هم اینجا اضافه یا ویرایش کنید
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      // رنگ پرکننده فیلدها کمی تیره‌تر از پس‌زمینه
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        // حاشیه نارنجی برای فیلد فوکوس شده، مشابه تم دارک
        // borderSide: BorderSide(color: Colors.deepOrange.shade400, width: 2),
      ),
      hintStyle: TextStyle(color: Colors.grey.shade100),
      // رنگ متن راهنما
      labelStyle: TextStyle(color: Colors.black87), // رنگ لیبل فیلد
    ),
    // تنظیمات برای دکمه‌ها
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // استفاده از رنگ اصلی تم برای پس‌زمینه دکمه
        backgroundColor: Color(0xFF143A62),
        foregroundColor: Colors.white, // متن سفید روی دکمه
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.deepOrange.shade400,
        // رنگ متن دکمه outline
        side: BorderSide(color: Colors.deepOrange.shade400, width: 2),
        // حاشیه دکمه
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    ),
  );
}
