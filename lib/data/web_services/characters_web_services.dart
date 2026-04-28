

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

  //   Future<List<dynamic>> getCharacterQuotes(String charName) async {
  //   try {
  //     Response response = await dio.get('quote' , queryParameters: {'author' : charName});
  //     print(response.data.toString());
  //     return response.data;
  //   } catch (e) {
  //     print(e.toString());
  //     return [];
  //   }
  // }

Future<List<dynamic>> getCharacterQuotes(String charName) async {
  try {
    await Future.delayed(Duration(milliseconds: 300));

    final Map<String, List<Map<String, dynamic>>> localQuotes = {
      "Rick Sanchez": [
        {"quote": "Wubba Lubba Dub Dub!"},
        {"quote": "I’m Pickle Rick!"},
        {"quote": "Sometimes science is more art than science."},
      ],
      "Morty Smith": [
        {"quote": "Aw jeez Rick..."},
        {"quote": "Nobody exists on purpose."},
      ],
      "Summer Smith": [
        {"quote": "I'm not your little sister anymore."},
      ],
      "Beth Smith": [
        {"quote": "I am a horse surgeon!"},
      ],
      "Jerry Smith": [
        {"quote": "I'm trying to be a better person!"},
      ],
      "Abadango Cluster Princess": [
        {"quote": "Welcome to Abadango!"},
      ],
      "Abradolf Lincler": [
        {"quote": "I was created to lead!"},
      ],
      "Adjudicator Rick": [
        {"quote": "Justice must be served."},
      ],
      "Agency Director": [
        {"quote": "We control the situation."},
      ],
      "Alan Rails": [
        {"quote": "Ghost trains incoming!"},
      ],
      "Albert Einstein": [
        {"quote": "Time is relative."},
      ],
    };

    return localQuotes[charName] ?? [];
  } catch (e) {
    print(e.toString());
    return [];
  }
}

  
}
