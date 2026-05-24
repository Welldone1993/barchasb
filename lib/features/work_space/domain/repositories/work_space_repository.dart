import 'package:fpdart/fpdart.dart';

import '../../../../core/utils/failure.dart';
import '../entities/ads_entity.dart';

abstract class WorkSpaceRepository {
  Future<Either<Failure, List<AdsEntity>>> fetchAds();
}
