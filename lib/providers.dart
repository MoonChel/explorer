import 'package:explorer/models.dart';
import 'package:explorer/services.dart';

class PlaceProvider {
  final PlaceService service;

  List<Place> places;

  PlaceProvider(this.service);

  Future fetchPlaces() async {
    this.places = await service.fetchPlaces();
  }
}
