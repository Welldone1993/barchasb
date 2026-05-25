import 'package:barchasb/core/network/api_endpoints.dart';
import 'package:barchasb/features/ads/data/models/job_seeker_ads_model.dart';
import 'package:dio/dio.dart';

abstract class AdsRemoteDataSource {
  Future<List<JobSeekerAdsModel>> fetchJobSeekerAds();
}

class AdsRemoteDataSourceImpl implements AdsRemoteDataSource {
  final Dio _dio;

  AdsRemoteDataSourceImpl(this._dio);



  @override
  Future<List<JobSeekerAdsModel>> fetchJobSeekerAds() async {
    final response = await _dio.get(ApiEndpoints.jobseekerAds);

    return response.data
        .map((json) => JobSeekerAdsModel.fromJson(json))
        .toList();
  }
}
