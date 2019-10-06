import 'dart:convert';

import 'package:explorer/dummy_places.dart';
import 'package:explorer/models.dart';
import 'package:http/http.dart' as http;

abstract class PlaceService {
  Future<List<Place>> fetchPlaces();
}

class ApiPlaceService implements PlaceService {
  static const _url =
      "https://my-json-server.typicode.com/MoonChel/explorer-places/db";

  Future<List<Place>> fetchPlaces() async {
    var response = await http.get(_url);
    var placesJson = json.decode(response.body)["places"] as List<dynamic>;

    return placesJson.map((placeJson) => Place.fromJson(placeJson)).toList();
  }
}

class DummyPlaceService implements PlaceService {
  @override
  Future<List<Place>> fetchPlaces() async {
    return dummyPlaces;
  }
}
