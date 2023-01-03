import 'package:flutter_bloc_template/data/api/rest_client.dart';
import 'package:flutter_bloc_template/data/dio_provider.dart';
import 'package:flutter_bloc_template/data/model/location_model.dart';
class HomeRepository {
  final dio = DioProvider.instance();

  Future<List<LocationModel>> getLocationList() async {
    final client = RestClient(await dio);
    return await client.getLocationList("query");
  }

 
}
