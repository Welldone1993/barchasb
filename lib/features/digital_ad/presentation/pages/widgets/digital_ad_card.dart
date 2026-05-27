// import 'package:barchasb/features/digital_ad/presentation/providers/digital_ads_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../../../core/utils/time_ago.dart';
// import '../../../domain/entities/digital_ad_entity.dart';
//
// class DigitalAdCard extends ConsumerWidget {
//   final DigitalAdEntity digitalAd;
//
//   const DigitalAdCard({super.key, required this.digitalAd});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.06),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             // Row: تصویر + عنوان + بج زمان
//             Row(
//               textDirection: TextDirection.rtl,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // عنوان و بج
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       TimeAgoWidget(dateTime: digitalAd.createdAt),
//                       const SizedBox(height: 6),
//                       Text(
//                         digitalAd.title,
//                         textAlign: TextAlign.right,
//                         textDirection: TextDirection.rtl,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF1E3A5F),
//                           fontFamily: 'Vazirmatn',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 // تصویر
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: digitalAd.imageUrl != null
//                       ? Image.network(
//                           digitalAd.imageUrl!,
//                           width: 64,
//                           height: 64,
//                           fit: BoxFit.cover,
//                         )
//                       : Container(
//                           width: 64,
//                           height: 64,
//                           color: Colors.grey.shade300,
//                         ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             // توضیحات
//             Text(
//               digitalAd.description ?? '',
//               textAlign: TextAlign.right,
//               textDirection: TextDirection.rtl,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               style: const TextStyle(
//                 fontSize: 13,
//                 color: Color(0xFF555555),
//                 height: 1.6,
//                 fontFamily: 'Vazirmatn',
//               ),
//             ),
//             const SizedBox(height: 12),
//             // دکمه‌ها
//             Row(
//               textDirection: TextDirection.rtl,
//               children: [
//                 OutlinedButton(
//                   onPressed: () {
//                     // TODO: navigate to detail page
//                   },
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFF1E3A5F)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 20,
//                       vertical: 8,
//                     ),
//                   ),
//                   child: const Text(
//                     'جزئیات',
//                     style: TextStyle(
//                       color: Color(0xFF1E3A5F),
//                       fontFamily: 'Vazirmatn',
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 OutlinedButton(
//                   onPressed: () {
//                     // TODO: toggle bookmark
//                     ref
//                         .read(digitalAdsProvider.notifier)
//                         .toggleBookmark(digitalAd.id);
//                   },
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFF1E3A5F)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 8,
//                     ),
//                   ),
//                   child: Icon(
//                     digitalAd.isBookmarked
//                         ? Icons.bookmark
//                         : Icons.bookmark_border,
//                     color: const Color(0xFF1E3A5F),
//                     size: 20,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../../../domain/entities/digital_ad_entity.dart';

class DigitalAdCard extends StatelessWidget {
  final DigitalAdEntity digitalAd; // اگر مدل خاصی دارید (مثل AdEntity) آن را جایگزین dynamic کنید

  const DigitalAdCard({super.key, required this.digitalAd});

  @override
  Widget build(BuildContext context) {
    // رنگ سرمه‌ای استفاده شده در متون و دکمه‌ها
    const primaryColor = Color(0xFF17304C);

    return Container(
      width: double.infinity,
      // ❌ دقت کنید که اینجا به هیچ وجه نباید ویژگی height تنظیم شود ❌
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // این خط باعث می‌شود ارتفاع به اندازه محتوا باشد و ارور ندهد
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // --- بخش اول: عکس، عنوان و زمان ---
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. باکس عکس (سمت راست)
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(12),
                ),
                // در آینده اگر عکس داشتید:
                // child: Image.network(digitalAd.image, fit: BoxFit.cover),
              ),
              const SizedBox(width: 12),

              // 2. عنوان و نشانگر زمان
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // عنوان آگهی
                    Expanded(
                      child: Text(
                        digitalAd.title ?? 'بدون عنوان',
                        style: const TextStyle(
                          color: primaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),

                    // نشانگر زمان (سمت چپ)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        '5 دقیقه پیش', // این مقدار را می‌توانید داینامیک کنید
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // --- بخش دوم: توضیحات ---
          Text(
            digitalAd.description ?? 'هیچ توضیحی برای آگهی اضافه نشده...',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              height: 1.6,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          // --- بخش سوم: دکمه‌ها ---
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // قرار دادن دکمه‌ها در انتهای سطر (سمت چپ)
            children: [
              // دکمه سیو / بوکمارک
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  border: Border.all(color: primaryColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.bookmark_add_outlined, color: primaryColor, size: 22),
                  onPressed: () {
                    // عملکرد ذخیره
                  },
                ),
              ),
              const SizedBox(width: 8),

              // دکمه جزئیات
              SizedBox(
                height: 38,
                child: OutlinedButton(
                  onPressed: () {
                    // عملکرد مشاهده جزئیات
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                  ),
                  child: const Text(
                    'جزئیات',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

