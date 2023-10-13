import 'package:alfred_interview/data/cryptocurrency/response/cryptocurrency_response.dart';
import 'package:alfred_interview/data/cryptocurrency/response/currency_bpi_response.dart';
import 'package:alfred_interview/domain/cryptocurrency/entity/bitcoin_price_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bpi_response.g.dart';

@JsonSerializable()
class BPIResponse {
  @JsonKey(name: 'USD')
  final CurrencyBPIResponse usd;
  @JsonKey(name: 'GBP')
  final CurrencyBPIResponse gbp;
  @JsonKey(name: 'EUR')
  final CurrencyBPIResponse eur;

  const BPIResponse({required this.usd, required this.gbp, required this.eur});

  factory BPIResponse.fromJson(Map<String, dynamic> json) =>
      _$BPIResponseFromJson(json);

  BitcoinPriceIndex toDomain() {
    return BitcoinPriceIndex(
      usd: usd.toDomain(),
      gbp: gbp.toDomain(),
      eur: eur.toDomain(),
    );
  }
}
