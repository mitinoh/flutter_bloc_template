import 'package:flutter_bloc_template/data/api/rest_client.dart';
import 'package:flutter_bloc_template/data/dio_provider.dart'; 

class UserRepository {
  final dio = DioProvider.instance();

  Future<dynamic> getUserData(String fid) async {
    final client = RestClient(await dio);
    return await client.getUserData(fid);
  }
}
