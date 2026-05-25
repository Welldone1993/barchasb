import 'package:barchasb/core/network/api_endpoints.dart';
import 'package:barchasb/features/ads/data/models/job_seeker_ads_model.dart';
import 'package:dio/dio.dart';

abstract class AdsRemoteDataSource {
  Future<List<JobSeekerAdModel>> fetchJobSeekerAds();
}

class AdsRemoteDataSourceImpl implements AdsRemoteDataSource {
  final Dio _dio;

  AdsRemoteDataSourceImpl(this._dio);

  @override
  Future<List<JobSeekerAdModel>> fetchJobSeekerAds() async {
    final response = await _dio.get(ApiEndpoints.jobseekerAds);
    final List<dynamic> data = response.data;
    return data.map((json) => JobSeekerAdModel.fromJson(json)).toList();
  }
}
