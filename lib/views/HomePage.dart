import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:explorer/providers.dart';
import 'package:explorer/components/_all.dart';

import 'package:explorer/views/_all.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var placeProvider = Provider.of<PlaceProvider>(context);

    return Scaffold(
      appBar: AppBarHomePage(),
      body: FutureBuilder(
        future: placeProvider.fetchPlaces(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: placeProvider.places.length,
              itemBuilder: (BuildContext context, int index) {
                return PlaceCardWidget(
                  key: Key(placeProvider.places[index].id),
                  place: placeProvider.places[index],
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PlaceDetailsPage.routeName,
                      arguments: placeProvider.places[index],
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
