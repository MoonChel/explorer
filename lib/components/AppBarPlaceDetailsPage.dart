import 'package:explorer/constants.dart';
import 'package:explorer/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:transparent_image/transparent_image.dart';

class AppBarPlaceDetailsPage extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarPlaceDetailsPage({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return AppBar(
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: Constants.appBarPadding,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: place.name, style: textTheme.headline),
                  TextSpan(text: "\n"),
                  TextSpan(text: place.subtitle, style: textTheme.subhead)
                ],
              ),
            ),
            if (place.icon.isSVG)
              SvgPicture.network(
                place.icon.url,
                color: Color(place.icon.colorHex),
                width: Constants.placeIconSize,
                height: Constants.placeIconSize,
                placeholderBuilder: (context) => Container(),
              )
            else
              FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: place.icon.url,
                width: Constants.placeIconSize,
                height: Constants.placeIconSize,
              )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Constants.appBarHeight;
}
