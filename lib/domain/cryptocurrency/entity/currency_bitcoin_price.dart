import 'package:equatable/equatable.dart';

class CurrencyBitcoinPrice extends Equatable {
  final String code;
  final double rateFloat;

  const CurrencyBitcoinPrice({required this.code, required this.rateFloat});

  @override
  List<Object?> get props => [code, rateFloat];
}
