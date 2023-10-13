import 'package:alfred_interview/domain/common/failure.dart';
import 'package:alfred_interview/domain/cryptocurrency/entity/bitcoin_price_index.dart';
import 'package:dartz/dartz.dart';

abstract class CryptocurrencyRepository {
  Future<Either<Failure, BitcoinPriceIndex>> getBitcoinPriceIndex();
}
