import 'package:flutter/material.dart';
import 'package:flutter_app/core/error/exceptions.dart';
import 'package:flutter_app/core/utils/utils.dart';
import 'package:flutter_app/features/data/client/client.dart';
import 'package:flutter_app/features/data/model/breeds_response_model.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
abstract class RemoteDataSource {
  Future<List<BreedsResponseModel>> getBreeds();
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final RestClient client;

  RemoteDataSourceImpl({@required this.client});

  @override
  Future<List<BreedsResponseModel>> getBreeds() async {
    try {
      final response = await client.getBreeds();
      if (response == null) {
        throw ServerException();
      } else
        return response;
    } on Exception catch (exception) {
      throw ServerException(message: Utils.ERROR_NO_RESPONSE);
    }
  }
}
