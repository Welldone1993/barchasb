import '../../domain/entities/ad_entity.dart';

class AdModel extends AdEntity {
  AdModel({
    required super.id,
    required super.title,
    super.category,
    super.state,
    super.city,
    super.application,
    super.status,
    super.description,
    super.priceIRT,
    super.isFixedPrice,
    super.isNegotiable,
    super.hasWarranty,
    super.isShippable,
    super.extraFeatures,
    super.isVerified,
    super.enableChat,
    super.enablePhone,
    super.paymentMethod,
    required super.adStatus,
    super.person,
    super.ownerId,
    super.createdAt,
    super.ratingAverage,
    super.ratingCount,
    super.imageUrls,
    super.mainImageUrl,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    // استخراج لیست تصاویر و تصویر اصلی
    List<String> parsedImageUrls = [];
    String? parsedMainImageUrl;

    if (json['images'] != null && json['images'] is List) {
      for (var img in json['images']) {
        if (img['url'] != null && img['url'].toString().isNotEmpty) {
          parsedImageUrls.add(img['url']);
          // اگر تصویر به عنوان main تنظیم شده بود، آن را ذخیره می‌کنیم
          if (img['isMain'] == true) {
            parsedMainImageUrl = img['url'];
          }
        }
      }
      // اگر تصویر اصلی پیدا نشد ولی لیست عکس داشتیم، عکس اول را اصلی در نظر می‌گیریم
      if (parsedMainImageUrl == null && parsedImageUrls.isNotEmpty) {
        parsedMainImageUrl = parsedImageUrls.first;
      }
    }

    return AdModel(
      id: json['_id'] ?? '',
      title: json['title'] ?? 'بدون عنوان',
      category: json['category'],
      state: json['state'],
      city: json['city'],
      application: json['application'],
      status: json['status'],
      description: json['description'],
      priceIRT: json['priceIRT'],
      isFixedPrice: json['isFixedPrice'] ?? false,
      isNegotiable: json['isNegotiable'] ?? false,
      hasWarranty: json['hasWarranty'] ?? false,
      isShippable: json['isShippable'] ?? false,
      extraFeatures: json['extraFeatures'] != null
          ? Map<String, dynamic>.from(json['extraFeatures'])
          : {},
      isVerified: json['isVerified'] ?? false,
      enableChat: json['enableChat'] ?? false,
      enablePhone: json['enablePhone'] ?? false,
      paymentMethod: json['paymentMethod'],
      adStatus: json['adStatus'] ?? 'unknown',
      person: json['person'],
      ownerId: json['owner']?['_id'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      ratingAverage: json['rating']?['average'] ?? 0,
      ratingCount: json['rating']?['count'] ?? 0,
      imageUrls: parsedImageUrls,
      mainImageUrl: parsedMainImageUrl,
    );
  }
}
