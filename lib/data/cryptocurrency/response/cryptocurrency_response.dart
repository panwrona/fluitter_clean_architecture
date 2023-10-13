import 'package:alfred_interview/data/cryptocurrency/response/bpi_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cryptocurrency_response.g.dart';

@JsonSerializable()
class CryptocurrencyResponse {
  @JsonKey(name: 'bpi')
  final BPIResponse bpi;

  const CryptocurrencyResponse({
    required this.bpi,
  });

  factory CryptocurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CryptocurrencyResponseFromJson(json);
}
