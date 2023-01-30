import 'package:dio/dio.dart';

import '../models/country_data_model.dart';

class ApiService {
  final dio = Dio();
  final String _baseUrl =
      'https://countriesnow.space/api/v0.1/countries/capital';

  Future<void> getCountryDatas() async {
    try {
      final response = await dio.get(_baseUrl);

      switch (response.statusCode) {
        case 200:
          ListData.fromJson(response.data["data"]);
          break;
        default:
      }
    } catch (e) {
      print(e);
    }
  }
}

class HandleGetDataException implements Exception {}
