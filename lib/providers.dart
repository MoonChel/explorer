import 'package:explorer/models.dart';
import 'package:explorer/services.dart';
import 'package:flutter/cupertino.dart';

class PlaceProvider {
  final PlaceService service;

  List<Place> places;

  PlaceProvider(this.service);

  Future fetchPlaces() async {
    this.places = await service.fetchPlaces();
  }
}

class PlaceViewSwitchProvider with ChangeNotifier {
  bool _isListView = true;

  get isListView {
    return _isListView;
  }

  set isListView(newVal) {
    _isListView = newVal;
    notifyListeners();
  }

  PlaceViewSwitchProvider();
}
