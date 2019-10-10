import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'package:explorer/providers.dart';
import 'package:explorer/service_locator.dart';
import 'package:explorer/services.dart';
import 'package:explorer/views/HomePage.dart';
import 'package:explorer/routes.dart';

void main() {
  registerServices();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Provider<PlaceProvider>(
      builder: (context) => PlaceProvider(GetIt.I.get<PlaceService>()),
      child: MaterialApp(
        title: 'Explorer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'DINNext',
          textTheme: textTheme.copyWith(
            headline: textTheme.headline.copyWith(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            subhead: textTheme.subhead.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),
            body1: textTheme.body1.copyWith(
              fontSize: 18,
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: onGenerateRoute,
        home: HomePage(),
      ),
    );
  }
}
