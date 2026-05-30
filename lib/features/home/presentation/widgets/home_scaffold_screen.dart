import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScaffoldScreen extends StatelessWidget {
  final Widget body;

  const HomeScaffoldScreen({super.key, required this.body});

  void _showComingSoonSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('به زودی...', style: TextStyle(fontFamily: 'Vazirmatn')),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          shadowColor: Colors.black12,
          toolbarHeight: 70,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset(
                'assets/logo_light.png',
                height: 40,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  color: Colors.blue,
                ), // اگر عکس لود نشد
              ),
              Spacer(),
              InkWell(
                onTap: () => _showComingSoonSnackbar(context),
                child: const Text(
                  'برچسب کلاب',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () => context.push('/login'),
                child: const Text(
                  'ورود',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () => context.push('/register'),
                child: const Text(
                  'ثبت نام',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF4A5568),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF4A5568),
                  size: 32,
                ),
                onPressed: () {
                  // باز کردن منوی کناری (چون RTL هستیم، endDrawer از چپ باز می‌شود)
                  Scaffold.of(context).openEndDrawer();
                },
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),

        endDrawer: Drawer(
          backgroundColor: const Color(0xFF1E3A5F),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white54, width: 1.5),
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _buildDrawerItem(
                  context: context,
                  title: 'خانه',
                  icon: Icons.home_rounded,
                  onTap: () => _showComingSoonSnackbar(context),
                ),
                _buildDrawerItem(
                  context: context,
                  title: 'درباره ما',
                  icon: Icons.info_outline_rounded,
                  onTap: () => _showComingSoonSnackbar(context),
                ),
                _buildDrawerItem(
                  context: context,
                  title: 'استخدام کارجو',
                  icon: Icons.assignment_ind_outlined,
                  hasArrow: true,
                  onTap: () => _showComingSoonSnackbar(context),
                ),
                _buildDrawerItem(
                  context: context,
                  title: 'پیدا کردن کار',
                  icon: Icons.search_rounded,
                  hasArrow: true,
                  onTap: () => _showComingSoonSnackbar(context),
                ),
              ],
            ),
          ),
        ),
        body: body,
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    bool hasArrow = false,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2A4B75), // رنگ کمی روشن‌تر برای پس‌زمینه دکمه‌ها
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: onTap,
        dense: true,
        leading: hasArrow
            ? const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 14,
              )
            : const SizedBox(width: 14),

        title: Text(
          title,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        trailing: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(icon, color: const Color(0xFF1E3A5F), size: 18),
        ),
      ),
    );
  }
}
