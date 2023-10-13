import 'package:alfred_interview/domain/cryptocurrency/entity/currency_bitcoin_price.dart';
import 'package:equatable/equatable.dart';

class BitcoinPriceIndex extends Equatable {
  final CurrencyBitcoinPrice usd;
  final CurrencyBitcoinPrice eur;
  final CurrencyBitcoinPrice gbp;

  const BitcoinPriceIndex({
    required this.usd,
    required this.eur,
    required this.gbp,
  });

  @override
  List<Object?> get props => [usd, eur, gbp];
}
