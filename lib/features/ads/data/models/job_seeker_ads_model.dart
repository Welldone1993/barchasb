import 'package:barchasb/features/ads/domain/entities/job_seeker_ads_entity.dart';

class JobSeekerAdsModel extends JobSeekerAdsEntity {
  JobSeekerAdsModel({required super.id});

  factory JobSeekerAdsModel.fromJson(Map<String, dynamic> json) =>
      JobSeekerAdsModel(id: json['_id']);
}
