import 'package:barchasb/core/utils/failure.dart';
import 'package:barchasb/features/ads/data/datasource/ads_remote_data_source.dart';
import 'package:barchasb/features/ads/domain/entities/job_seeker_ads_entity.dart';
import 'package:barchasb/features/ads/domain/repositories/ads_repository.dart';
import 'package:fpdart/fpdart.dart';

class AdsRepositoryImpl extends AdsRepository {
  final AdsRemoteDataSource _remoteDatasource;

  AdsRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<Failure, List<JobSeekerAdEntity>>> fetchJobSeekerAds() async {
    try {
      final List<JobSeekerAdEntity> ads = await _remoteDatasource
          .fetchJobSeekerAds();
      return Right(ads);
    } on ServerException catch (e) {
      return Left(Failure(e.message ?? 'خطا در دریافت اطلاعات از سرور'));
    }
  }
}
