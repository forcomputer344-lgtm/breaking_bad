import 'package:dio/dio.dart';
import '../../constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60), // 60 seconds,
      receiveTimeout: Duration(seconds: 60),
    );

    dio = Dio(options);
  }

  // Future<List<dynamic>> getAllCharacters() async {
  //   try {
  //     Response response = await dio.get('characters');
  //     print(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');

      return response.data['results']; // 👈 هنا المشكلة كانت
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
