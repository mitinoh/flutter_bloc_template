import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc_template/data/model/location_model.dart';

part 'rest_client.g.dart';

//when change baseUri, execute:  flutter pub run build_runner build
@RestApi(baseUrl: "http://localhost:3000/api")

abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/location?_={query}")
  @DioResponseType(ResponseType.json)
  Future<List<LocationModel>> getLocationList(@Path("query") String? query);
  
  @GET("/user/fid/{fid}")
  @DioResponseType(ResponseType.json)
  Future<dynamic> getUserData(@Path("fid") String? fid);

}
