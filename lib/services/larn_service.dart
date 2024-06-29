import 'package:dio/dio.dart';
import 'package:larn/models/larn.dart';

class LarnService {
  late Dio dio;

  LarnService() {
    dio = Dio();
  }

  Future<List<Larn>> getLarns() async {
    try {
      Response response = await dio.get<List<dynamic>>(
          'https://ais-be.tu4rl4.easypanel.host/character?record_status=A');
      if (response.statusCode == 200 && response.data is List) {
        return (response.data as List)
            .map((larn) => Larn.fromJson(larn))
            .toList();
      }
    } catch (err) {
      print(err);
    }
    return [];
  }
}
