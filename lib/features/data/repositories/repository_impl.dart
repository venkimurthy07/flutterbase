import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/network/network_info.dart';
import 'package:flutter_app/features/data/datasource/local_datasource.dart';
import 'package:flutter_app/features/data/datasource/remote_datasource.dart';
import 'package:flutter_app/features/domain/entities/breeds_information_entity.dart';
import 'package:flutter_app/features/domain/repositories/repository.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
class RepositoryImpl implements Repository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryImpl(
      {@required this.networkInfo,
      @required this.localDataSource,
      @required this.remoteDataSource});

  @override
  Future<Either<Failure, List<BreedsInformationEntity>>> getBreeds() async {
    try {
      final loadedDataModel = await remoteDataSource.getBreeds();

      List<BreedsInformationEntity> listofBeeds = [];
      loadedDataModel.forEach((element) {
        listofBeeds.add(BreedsInformationEntity(
            element.id, element.name, element?.image?.url));
      });
      return Right(listofBeeds);
    } on ValidationException catch (e) {
      return Left(ServerFailure(message: e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
