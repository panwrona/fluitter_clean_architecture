import 'package:alfred_interview/data/cryptocurrency/cryptocurrency_repository_impl.dart';
import 'package:alfred_interview/data/cryptocurrency/remote/cryptocurrency_remote_data.dart';
import 'package:alfred_interview/domain/common/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../common/test_data.dart';
import '../common/test_mocks.dart';

void main() {
  setUp(() async {
    await registerMocks();
  });

  group('CryptocurrencyRepositoryImpl', () {
    test(
        'should call remote api data and return Either.right with domain model when api call is successful',
        () async {
      //arrange
      final repository = CryptocurrencyRepositoryImpl();
      final remoteDataSource = GetIt.I<CryptocurrencyRemoteData>();
      when(remoteDataSource.getBPI()).thenAnswer((_) async => bpi);

      //act
      final response = await repository.getBitcoinPriceIndex();

      //assert
      expect(response, right(bpi.toDomain()));
    });

    test(
        'should call remote api data and return Either.left with Failure object when api call failed',
        () async {
      //arrange
      final error = Error();
      final repository = CryptocurrencyRepositoryImpl();
      final remoteDataSource = GetIt.I<CryptocurrencyRemoteData>();
      when(remoteDataSource.getBPI()).thenThrow(error);

      //act
      final response = await repository.getBitcoinPriceIndex();

      //assert
      expect(response, left(Failure(error.toString())));
    });
  });
}
