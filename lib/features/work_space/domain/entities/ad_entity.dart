class AdEntity {
  final String id;
  final String title;
  final String? category;
  final String? state;
  final String? city;
  final String? application;
  final String? status;
  final String? description;
  final int? priceIRT;
  final bool isFixedPrice;
  final bool isNegotiable;
  final bool hasWarranty;
  final bool isShippable;
  final Map<String, dynamic> extraFeatures;
  final bool isVerified;
  final bool enableChat;
  final bool enablePhone;
  final String? paymentMethod;
  final String adStatus;
  final String? person;
  final String? ownerId;
  final DateTime? createdAt;
  final num ratingAverage;
  final int ratingCount;
  final List<String> imageUrls; // لیست تمام تصاویر
  final String? mainImageUrl;   // آدرس تصویر اصلی (برای نمایش در لیست‌ها)

  AdEntity({
    required this.id,
    required this.title,
    this.category,
    this.state,
    this.city,
    this.application,
    this.status,
    this.description,
    this.priceIRT,
    this.isFixedPrice = false,
    this.isNegotiable = false,
    this.hasWarranty = false,
    this.isShippable = false,
    this.extraFeatures = const {},
    this.isVerified = false,
    this.enableChat = false,
    this.enablePhone = false,
    this.paymentMethod,
    required this.adStatus,
    this.person,
    this.ownerId,
    this.createdAt,
    this.ratingAverage = 0,
    this.ratingCount = 0,
    this.imageUrls = const [],
    this.mainImageUrl,
  });
}
