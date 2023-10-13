import 'package:alfred_interview/domain/cryptocurrency/entity/bitcoin_price_index.dart';
import 'package:alfred_interview/domain/cryptocurrency/entity/currency_bitcoin_price.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpi_list_state.freezed.dart';

@freezed
class BPIListState with _$BPIListState {
  const factory BPIListState({
    @Default(true) final bool isLoading,
    @Default(null) final String? errorMessage,
    @Default(null) final CurrencyRateChange? usd,
    @Default(null) final CurrencyRateChange? eur,
    @Default(null) final CurrencyRateChange? gbp,
  }) = _BPIListState;

  const BPIListState._();

  BPIListState fromBPI(BitcoinPriceIndex bpi) => copyWith(
        usd: usd == null
            ? CurrencyRateChange(current: bpi.usd)
            : usd!.fromCurrencyBitcoinPrice(bpi.usd),
        eur: eur == null
            ? CurrencyRateChange(current: bpi.eur)
            : eur!.fromCurrencyBitcoinPrice(bpi.eur),
        gbp: gbp == null
            ? CurrencyRateChange(current: bpi.gbp)
            : gbp!.fromCurrencyBitcoinPrice(bpi.gbp),
      );

  bool get hasBPIData => usd != null || eur != null || gbp != null;
}

@freezed
class CurrencyRateChange with _$CurrencyRateChange {
  const factory CurrencyRateChange({
    required final CurrencyBitcoinPrice current,
    final CurrencyBitcoinPrice? previous,
  }) = _CurrencyRateChange;

  const CurrencyRateChange._();

  CurrencyRateChange fromCurrencyBitcoinPrice(CurrencyBitcoinPrice price) =>
      copyWith(previous: current, current: price);

  bool get isLower =>
      previous != null && current.rateFloat < previous!.rateFloat;
}
