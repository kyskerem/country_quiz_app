import 'package:dio/dio.dart';

import '../models/country_data_model.dart';

class ApiService {
  final dio = Dio();
  final String _baseUrl =
      'https://quiz-app-3018d-default-rtdb.firebaseio.com/countryData/-NNCTLhGLeP5iYqhp5sK.json';

  Future<void> getCountryDatas() async {
    try {
      final response = await dio.get(_baseUrl);

      switch (response.statusCode) {
        case 200:
          ListData.fromJson(response.data);
          break;
        default:
      }
    } catch (e) {
      throw '$e';
    }
  }
}

class HandleGetDataException implements Exception {}
