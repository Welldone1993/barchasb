import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // رنگ‌های استفاده شده در طراحی
    const Color primaryDarkBlue = Color(0xFF1A3B5C);
    const Color lightBlueBackground = Color(0xFFE8EFFF);
    const Color pageBackgroundColor = Color(0xFFF3F4F6);

    return Scaffold(
      backgroundColor: pageBackgroundColor,
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl, // راست‌چین کردن کل صفحه
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // دکمه بازگشت (بالا سمت چپ)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_circle_left_outlined,
                      color: primaryDarkBlue,
                      size: 36,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(height: 20),

                // کانتینر اصلی (کارت سفید و آبی)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // بخش بالایی (سفید - فرم ورود)
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            const Text(
                              'ورود',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: primaryDarkBlue,
                              ),
                            ),
                            const SizedBox(height: 30),

                            // فیلد شماره موبایل
                            _buildTextField(
                              hintText: '09966698861',
                              icon: Icons.phone,
                              backgroundColor: lightBlueBackground,
                              iconColor: primaryDarkBlue,
                            ),
                            const SizedBox(height: 16),

                            // فیلد رمز عبور
                            _buildTextField(
                              hintText: '........',
                              icon: Icons.lock,
                              isPassword: true,
                              backgroundColor: lightBlueBackground,
                              iconColor: primaryDarkBlue,
                            ),
                            const SizedBox(height: 24),

                            // دکمه ورود
                            SizedBox(
                              width: double.infinity,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {
                                  // TODO: فراخوانی متد لاگین از طریق ref.read
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryDarkBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'ورود',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // لینک‌های ثبت نام و فراموشی رمز
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'ثبت نام',
                                    style: TextStyle(
                                      color: primaryDarkBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'فراموشی رمز عبور',
                                    style: TextStyle(
                                      color: primaryDarkBlue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // بخش پایینی (آبی تیره - لوگو)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 40),
                        decoration: const BoxDecoration(
                          color: primaryDarkBlue,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: Center(
                          // به جای این آیکون، تصویر لوگوی خود را قرار دهید:
                          // Image.asset('assets/images/logo.png', height: 100)
                          child: Icon(
                            Icons.sticky_note_2, // آیکون جایگزین موقت
                            color: Colors.lightBlue.shade400,
                            size: 80,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ویجت کمکی برای ساخت تکست‌فیلدها (می‌توانید بعدا آن را به پوشه widgets منتقل کنید)
  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    required Color backgroundColor,
    required Color iconColor,
    bool isPassword = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: TextField(
        obscureText: isPassword,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: Icon(icon, color: iconColor),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}
