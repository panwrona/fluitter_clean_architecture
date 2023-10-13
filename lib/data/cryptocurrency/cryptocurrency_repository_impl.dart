import 'package:alfred_interview/data/cryptocurrency/remote/cryptocurrency_remote_data.dart';
import 'package:alfred_interview/domain/common/failure.dart';
import 'package:alfred_interview/domain/cryptocurrency/entity/bitcoin_price_index.dart';
import 'package:alfred_interview/domain/cryptocurrency/repository/cryptocurrency_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

class CryptocurrencyRepositoryImpl extends CryptocurrencyRepository {
  final CryptocurrencyRemoteData _remoteData =
      GetIt.I<CryptocurrencyRemoteData>();

  @override
  Future<Either<Failure, BitcoinPriceIndex>> getBitcoinPriceIndex() async {
    try {
      final response = await _remoteData.getBPI();
      return right(response.toDomain());
    } on Error catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
