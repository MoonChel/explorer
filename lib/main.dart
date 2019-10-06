import 'package:explorer/providers.dart';
import 'package:explorer/service_locator.dart';
import 'package:explorer/services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:provider/provider.dart';

import 'package:explorer/routes.dart';

void main() {
  registerServices();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<PlaceProvider>(
      builder: (context) => PlaceProvider(GetIt.I.get<PlaceService>()),
      child: MaterialApp(
        title: 'Explorer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: routes,
      ),
    );
  }
}
