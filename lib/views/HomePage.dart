import 'package:explorer/constants.dart';
import 'package:explorer/models.dart';
import 'package:explorer/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var placeProvider = Provider.of<PlaceProvider>(context);
    return Scaffold(
      appBar: buildAppBar(textTheme),
      body: FutureBuilder(
        future: placeProvider.fetchPlaces(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: placeProvider.places.length,
              itemBuilder: (BuildContext context, int index) {
                return buildCard(textTheme, placeProvider.places[index]);
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

  Container buildCard(TextTheme textTheme, Place place) {
    return Container(
      height: Constants.cardHeight,
      child: Card(
        elevation: 2,
        margin: EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return AspectRatio(
                      aspectRatio: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          color: Colors.teal,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(place.name, style: textTheme.headline),
                      Text(place.address, style: textTheme.subhead),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Opens at " + place.openHours.opensTodayFrom(),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar(TextTheme textTheme) {
    return PreferredSize(
      preferredSize: Constants.appBarHeight,
      child: AppBar(
        backgroundColor: Constants.appBarColor,
        flexibleSpace: FlexibleSpaceBar(
          title: Padding(
            padding: Constants.appBarPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Most Popular", style: textTheme.headline),
                      TextSpan(text: "\n"),
                      TextSpan(
                        text: "Brno, Czech Republic",
                        style: textTheme.subhead,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.map, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
