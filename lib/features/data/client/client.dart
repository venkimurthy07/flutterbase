import 'package:dio/dio.dart';
import 'package:flutter_app/core/utils/my_shared_pref.dart';
import 'package:flutter_app/features/data/model/breeds_response_model.dart';
import 'package:retrofit/http.dart';

part 'client.g.dart';

/**
 * Created by venkateshmurthytp on 23,June,2021
 */
@RestApi(baseUrl: "https://api.thedogapi.com/")
abstract class RestClient {
  factory RestClient(final Dio dio, final MySharedPref sharedPref) {
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions option) {
      /// Additional headers information
      // option.headers[Utils.AUTHORIZATION] = Utils.AUTHORIZATION_TOKEN;
      // option.headers[Utils.X_MESSAGE_ID] = Utils.X_MESSAGE_ID_TOKEN;
      // option.headers[Utils.CONTENT_TYPE] = Utils.CONTENT_APPLICATION_JSON;
      print("Headers ${sharedPref.getToken()} ${option.headers}");
      return option;
    }));
    return _RestClient(dio);
  }

  @GET("/v1/breeds")
  Future<List<BreedsResponseModel>> getBreeds();
}
