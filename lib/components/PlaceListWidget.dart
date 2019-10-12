import 'package:explorer/components/_all.dart';
import 'package:explorer/models.dart';
import 'package:explorer/views/PlaceDetailsPage.dart';
import 'package:flutter/material.dart';

class PlaceListWidget extends StatelessWidget {
  const PlaceListWidget({
    Key key,
    this.places,
  }) : super(key: key);

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (BuildContext context, int index) {
        return PlaceCardWidget(
          key: Key(places[index].id),
          place: places[index],
          onTap: () {
            Navigator.of(context).pushNamed(
              PlaceDetailsPage.routeName,
              arguments: places[index],
            );
          },
        );
      },
    );
  }
}
