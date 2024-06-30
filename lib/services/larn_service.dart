import 'package:dio/dio.dart';
import 'package:larn/models/larn.dart';

class LarnService {
  late Dio dio;
  List<Larn> larnList = [];

  LarnService() {
    dio = Dio();
  }

  Future<List<dynamic>> getLarns() async {
    try {
      Response response = await dio.get<List<dynamic>>(
          'https://ais-be.tu4rl4.easypanel.host/character?record_status=A');
      if (response.statusCode == 200 && response.data is List) {
        return (response.data)
            .map((larn) => {
                  'id': larn['_id'],
                  'name': larn['name'],
                  'description': larn['description'],
                  'image_url': larn['image_url'],
                })
            .map((larn) => Larn.fromJson(larn))
            .toList();
      }
    } catch (err) {
      print(err);
    }
    return [];
  }
}
