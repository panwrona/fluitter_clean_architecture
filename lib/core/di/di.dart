import 'package:alfred_interview/core/di/dio_init.dart';
import 'package:alfred_interview/data/cryptocurrency/cryptocurrency_repository_impl.dart';
import 'package:alfred_interview/data/cryptocurrency/local/cryptocurrency_local_data.dart';
import 'package:alfred_interview/data/cryptocurrency/local/storage_provider.dart';
import 'package:alfred_interview/data/cryptocurrency/remote/cryptocurrency_remote_data.dart';
import 'package:alfred_interview/domain/common/interval_emitter.dart';
import 'package:alfred_interview/domain/cryptocurrency/get_bitcoin_price_index_usecase.dart';
import 'package:alfred_interview/domain/cryptocurrency/repository/cryptocurrency_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDI() async {
  //Cryptocurrency
  getIt.registerLazySingletonAsync<CryptocurrencyLocalData>(
      () async => CryptocurrencyLocalData(
            await BPIStorageProvider.provide(),
          ),
      dispose: (object) async => await BPIStorageProvider.dispose());
  getIt.registerLazySingleton<Dio>(() => dioInit());
  getIt.registerLazySingleton<CryptocurrencyRemoteData>(
    () => CryptocurrencyRemoteData(),
  );
  getIt.registerLazySingleton<CryptocurrencyRepository>(
    () => CryptocurrencyRepositoryImpl(),
  );
  getIt.registerLazySingleton<GetBitcoinPriceIndexUseCase>(
    () => GetBitcoinPriceIndexUseCase(),
  );

  //common
  getIt.registerLazySingleton<IntervalEmitter>(() => IntervalEmitter());
}
