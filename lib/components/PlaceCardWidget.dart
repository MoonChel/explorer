import 'package:explorer/constants.dart';
import 'package:explorer/models.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceCardWidget extends StatelessWidget {
  const PlaceCardWidget({
    Key key,
    this.place,
    this.onTap,
  }) : super(key: key);

  final Place place;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        height: Constants.cardHeight,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.borderRadius),
          ),
          elevation: 2,
          margin: EdgeInsets.only(top: 10, right: 10, left: 10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: place.images.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: AspectRatio(
                          aspectRatio: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              Constants.borderRadius,
                            ),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: place.images[index],
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(place.name, style: textTheme.title),
                      Text(
                        place.address.shortAddress,
                        style: textTheme.subtitle.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Opens at " + place.openHours.opensTodayFrom(),
                          style: textTheme.body1.copyWith(
                            color: Constants.appBarColor,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
