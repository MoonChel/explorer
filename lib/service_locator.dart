import 'package:explorer/services.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/foundation.dart';

void registerServices() {
  if (kReleaseMode) {
    GetIt.I.registerSingleton<PlaceService>(ApiPlaceService());
  } else {
    GetIt.I.registerSingleton<PlaceService>(DummyPlaceService());
  }
}
