import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio dioInit() {
  final dio = Dio();
  dio.options.baseUrl = dotenv.get(
    'BASE_URL',
    fallback: 'https://api.coindesk.com/v1/bpi/currentprice.json',
  );
  dio.options.contentType = 'application/json';
  return dio;
}
