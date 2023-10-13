import 'package:alfred_interview/domain/common/failure.dart';
import 'package:alfred_interview/domain/cryptocurrency/entity/bitcoin_price_index.dart';
import 'package:alfred_interview/domain/cryptocurrency/repository/cryptocurrency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

class GetBitcoinPriceIndexUseCase {
  final CryptocurrencyRepository _repository =
      GetIt.I<CryptocurrencyRepository>();

  Future<Either<Failure, BitcoinPriceIndex>> execute() {
    return _repository.getBitcoinPriceIndex();
  }
}
