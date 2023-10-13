import 'package:alfred_interview/data/cryptocurrency/response/bpi_response.dart';
import 'package:alfred_interview/data/cryptocurrency/response/currency_bpi_response.dart';
import 'package:alfred_interview/domain/common/failure.dart';
import 'package:alfred_interview/domain/cryptocurrency/entity/bitcoin_price_index.dart';
import 'package:dartz/dartz.dart';

//Cryptocurrency
const usd = CurrencyBPIResponse(code: 'USD', rateFloat: 0.1);
const gbp = CurrencyBPIResponse(code: 'GBP', rateFloat: 0.1);
const eur = CurrencyBPIResponse(code: 'EUR', rateFloat: 0.1);
const bpi = BPIResponse(usd: usd, gbp: gbp, eur: eur);
final successfulResponse = right<Failure, BitcoinPriceIndex>(bpi.toDomain());
const failedMessage = 'Fail';
final failure = left<Failure, BitcoinPriceIndex>(const Failure(failedMessage));
