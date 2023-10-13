import 'package:alfred_interview/domain/cryptocurrency/entity/currency_bitcoin_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_bpi_response.g.dart';

@JsonSerializable()
class CurrencyBPIResponse {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'rate_float')
  final double rateFloat;

  const CurrencyBPIResponse({required this.code, required this.rateFloat});

  factory CurrencyBPIResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyBPIResponseFromJson(json);

  CurrencyBitcoinPrice toDomain() {
    return CurrencyBitcoinPrice(
      code: code,
      rateFloat: rateFloat,
    );
  }
}
