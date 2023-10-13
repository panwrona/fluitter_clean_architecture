import 'package:alfred_interview/domain/cryptocurrency/get_bitcoin_price_index_usecase.dart';
import 'package:alfred_interview/domain/cryptocurrency/repository/cryptocurrency_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../common/test_data.dart';
import '../common/test_mocks.dart';

void main() {
  setUp(() async {
    await registerMocks();
  });

  group('GetBitcoinPriceIndexUseCase', () {
    test('Should call CryptocurrencyRepository when useCase is executed',
        () async {
      //arrange
      final useCase = GetBitcoinPriceIndexUseCase();
      when(GetIt.I<CryptocurrencyRepository>().getBitcoinPriceIndex())
          .thenAnswer((_) async => successfulResponse);

      //act
      final result = await useCase.execute();

      //assert
      expect(result, successfulResponse);
    });
  });
}
