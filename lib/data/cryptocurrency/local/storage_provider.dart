import 'dart:io';

import 'package:alfred_interview/data/cryptocurrency/response/bpi_response.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

abstract class BPIStorage {
  void putBPI(BPIResponse response);

  BPIResponse? getCurrentBPI();
}

class BPIStorageProvider {
  static Future<BPIStorage?> provide() async {
    if (kIsWeb) {
      return WebStorage();
    } else if (Platform.isAndroid || Platform.isIOS) {
      return MobileStorage(Hive.box("functionality_responses"));
    }
    return null;
  }

  static Future<void> dispose() async {
    await Hive.close();
  }
}

class MobileStorage extends BPIStorage {
  final Box<BPIResponse> box;
  final String currentBPIResponseKey = 'CURRENT_BPI_RESPONSE_KEY';

  MobileStorage(this.box);

  @override
  BPIResponse? getCurrentBPI() {
    return box.get(currentBPIResponseKey, defaultValue: null);
  }

  @override
  void putBPI(BPIResponse response) {
    box.put(currentBPIResponseKey, response);
  }
}

class WebStorage extends BPIStorage {
  BPIResponse? _currentResponse;

  @override
  BPIResponse? getCurrentBPI() {
    return _currentResponse;
  }

  @override
  void putBPI(BPIResponse response) {
    _currentResponse = response;
  }
}
