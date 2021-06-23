import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/features/domain/entities/breeds_information_entity.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
abstract class Repository {
  /// Function used to get breeds
  Future<Either<Failure, List<BreedsInformationEntity>>> getBreeds();
}
