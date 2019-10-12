import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:explorer/providers.dart';
import 'package:explorer/components/_all.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var placeProvider = Provider.of<PlaceProvider>(context);
    return FutureBuilder(
      future: placeProvider.fetchPlaces(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return ChangeNotifierProvider<PlaceViewSwitchProvider>(
          builder: (cxt) => PlaceViewSwitchProvider(),
          child: Scaffold(
            appBar: AppBarHomePage(),
            body: Consumer<PlaceViewSwitchProvider>(
              builder: (ctx, provider, child) {
                if (provider.isListView) {
                  return child;
                }
                return PlaceMapWidget(places: placeProvider.places);
              },
              child: PlaceListWidget(places: placeProvider.places),
            ),
          ),
        );
      },
    );
  }
}
