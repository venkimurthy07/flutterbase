import 'package:dartz/dartz.dart';
import 'package:flutter_app/core/error/failures.dart';
import 'package:flutter_app/core/usecase/usecase.dart';
import 'package:flutter_app/features/domain/entities/breeds_information_entity.dart';
import 'package:flutter_app/features/domain/repositories/repository.dart';

class GetBreedsUseCase
    extends UseCase<List<BreedsInformationEntity>, NoParams> {
  final Repository _repository;

  GetBreedsUseCase(this._repository);

  @override
  Future<Either<Failure, List<BreedsInformationEntity>>> call(
      NoParams params) async {
    return await _repository.getBreeds();
  }
}
