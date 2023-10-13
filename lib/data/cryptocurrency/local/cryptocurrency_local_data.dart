import 'package:alfred_interview/data/cryptocurrency/local/storage_provider.dart';
import 'package:alfred_interview/data/cryptocurrency/response/bpi_response.dart';

class CryptocurrencyLocalData {
  final BPIStorage? _storage;

  CryptocurrencyLocalData(this._storage);

  BPIResponse? getBPI(String exampleId) {
    if (_storage == null) {
      return null;
    }
    return _storage!.getCurrentBPI();
  }

  void putBPI(BPIResponse response) {
    if (_storage == null) {
      return;
    }
    _storage!.putBPI(response);
  }
}
