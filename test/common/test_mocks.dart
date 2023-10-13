import 'package:alfred_interview/data/cryptocurrency/remote/cryptocurrency_remote_data.dart';
import 'package:alfred_interview/domain/common/interval_emitter.dart';
import 'package:alfred_interview/domain/cryptocurrency/get_bitcoin_price_index_usecase.dart';
import 'package:alfred_interview/domain/cryptocurrency/repository/cryptocurrency_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'test_mocks.mocks.dart';

@GenerateMocks([
  CryptocurrencyRemoteData,
  CryptocurrencyRepository,
  GetBitcoinPriceIndexUseCase,
  IntervalEmitter,
])
Future<void> registerMocks() async {
  await GetIt.I.reset();

  GetIt.I.registerLazySingleton<CryptocurrencyRemoteData>(
    () => MockCryptocurrencyRemoteData(),
  );
  GetIt.I.registerLazySingleton<CryptocurrencyRepository>(
    () => MockCryptocurrencyRepository(),
  );
  GetIt.I.registerLazySingleton<GetBitcoinPriceIndexUseCase>(
    () => MockGetBitcoinPriceIndexUseCase(),
  );
  GetIt.I.registerLazySingleton<IntervalEmitter>(
    () => MockIntervalEmitter(),
  );
}
