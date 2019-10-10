import 'package:explorer/views/_all.dart';
import 'package:flutter/material.dart';

import 'models.dart';

final routes = {
  HomePage.routeName: (c) => HomePage(),
};

MaterialPageRoute onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PlaceDetailsPage.routeName:
      final Place place = settings.arguments;
      return MaterialPageRoute(
        builder: (context) => PlaceDetailsPage(
          place: place,
        ),
      );

    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}
