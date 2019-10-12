import 'dart:async';
import 'dart:typed_data';

import 'package:explorer/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as image;

class PlaceMapWidget extends StatefulWidget {
  final List<Place> places;

  PlaceMapWidget({this.places});

  @override
  _PlaceMapWidgetState createState() => _PlaceMapWidgetState();
}

class _PlaceMapWidgetState extends State<PlaceMapWidget> {
  Completer<GoogleMapController> _controller = Completer();
  String _mapStyle;
  var placesMarkers = Set<Marker>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(49.1951, 16.6068),
    zoom: 15.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    bearing: 192.8334901395799,
    target: LatLng(37.43296265331129, -122.08832357078792),
    tilt: 59.440717697143555,
    zoom: 19.151926040649414,
  );

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/map_style.json').then((string) {
      _mapStyle = string;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadMarkers(),
      initialData: true,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Scaffold(
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
            markers: placesMarkers,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: _jumpToPlace,
            label: Text('To the lake!'),
            icon: Icon(Icons.directions_boat),
          ),
        );
      },
    );
  }

  Future<void> _jumpToPlace() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<bool> loadMarkers() async {
    await Future.forEach(widget.places, (Place p) async {
      var request = await http.get(
        p.icon.darkUrl == null ? p.icon.url : p.icon.darkUrl,
      );
      var backgroundImage = await rootBundle.load(
        'assets/Icons/3.0x/Path 6.png',
      );
      var backgroundImageBytes = backgroundImage.buffer.asUint8List();

      placesMarkers.add(
        Marker(
          markerId: MarkerId(p.id),
          position: LatLng(
            p.localtion.latitude,
            p.localtion.longitude,
          ),
          icon: createIcon(request.bodyBytes, backgroundImageBytes),
        ),
      );
    });
    return true;
  }

  BitmapDescriptor createIcon(
    Uint8List iconBytes,
    Uint8List backgroundImageBytes,
  ) {
    var icon = image.decodeImage(iconBytes);
    var backgroundImage = image.decodeImage(backgroundImageBytes);

    var size = 200;
    var backTailHeight = 15;

    var resizedBack = image.copyResize(
      backgroundImage,
      width: size,
      height: size + backTailHeight,
    );
    image.Image resizedIcon;
    var padding = 40;
    if (icon.width > icon.height) {
      resizedIcon = image.copyResize(
        icon,
        width: size - padding,
      );
    } else {
      resizedIcon = image.copyResize(
        icon,
        height: size - padding,
      );
    }

    var iconWithBackground = image.drawImage(
      resizedBack,
      resizedIcon,
      dstX: (resizedBack.width - resizedIcon.width) ~/ 2,
      dstY: (resizedBack.height - resizedIcon.height) ~/ 2 - backTailHeight,
    );
    var resizedBackPng = Uint8List.fromList(
      image.encodePng(iconWithBackground),
    );
    return BitmapDescriptor.fromBytes(resizedBackPng);
  }
}
