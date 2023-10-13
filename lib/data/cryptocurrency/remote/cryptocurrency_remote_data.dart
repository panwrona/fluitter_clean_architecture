import 'dart:convert';

import 'package:alfred_interview/data/cryptocurrency/response/bpi_response.dart';
import 'package:alfred_interview/data/cryptocurrency/response/cryptocurrency_response.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class CryptocurrencyRemoteData {
  final _dio = GetIt.I<Dio>();

  Future<BPIResponse> getBPI() async {
    try {
      final response = await _dio.get('');
      if (response.statusCode == 200 && response.data != null) {
        return CryptocurrencyResponse.fromJson(jsonDecode(response.data)).bpi;
      } else {
        throw Error();
      }
    } on Error catch (_) {
      rethrow;
    }
  }
}
