import 'package:explorer/utils.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:explorer/components/_all.dart';
import 'package:explorer/constants.dart';
import 'package:explorer/models.dart';

class PlaceDetailsPage extends StatelessWidget {
  static const routeName = './PlaceDetailsPage';

  final Place place;

  PlaceDetailsPage({@required this.place});

  @override
  Widget build(BuildContext context) {
    var globalTheme = Theme.of(context);
    var textTheme = globalTheme.textTheme;

    return Theme(
      data: globalTheme.copyWith(
        appBarTheme: globalTheme.appBarTheme.copyWith(
          color: Color(
            place.colorSettings.headerColorHex,
          ),
        ),
        scaffoldBackgroundColor: Color(place.colorSettings.bodyColorHex),
        iconTheme: globalTheme.iconTheme.copyWith(
          size: 30,
        ),
        textTheme: globalTheme.textTheme.copyWith(
          headline: textTheme.headline.copyWith(
            color: Color(place.colorSettings.bodyColorHex),
          ),
          subhead: textTheme.subhead.copyWith(
            color: Color(place.colorSettings.bodyColorHex),
          ),
          title: textTheme.title.copyWith(
            color: Color(place.colorSettings.fontColor),
            fontWeight: FontWeight.bold,
          ),
          body1: textTheme.body1.copyWith(color: Colors.black),
          body2: textTheme.body2.copyWith(color: Colors.black),
        ),
      ),
      child: PlaceDetailsWidget(place: place),
    );
  }
}

class PlaceDetailsWidget extends StatelessWidget {
  const PlaceDetailsWidget({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPlaceDetailsPage(place: place),
      body: ListView(
        children: <Widget>[
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: place.images[0],
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.all(Constants.bodyPadding),
            child: AnimatedPageDetailsBody(place: place),
          )
        ],
      ),
    );
  }
}

class AnimatedPageDetailsBody extends StatefulWidget {
  const AnimatedPageDetailsBody({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  _AnimatedPageDetailsBodyState createState() =>
      _AnimatedPageDetailsBodyState();
}

class _AnimatedPageDetailsBodyState extends State<AnimatedPageDetailsBody>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Offset> slideAnim;
  Animation<double> opacityAnim;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    slideAnim = Tween(
      begin: Offset(0.1, 0.0),
      end: Offset.zero,
    ).animate(_animationController);

    opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return FadeTransition(
      opacity: opacityAnim,
      child: SlideTransition(
        position: slideAnim,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("ABOUT US", style: textTheme.title),
            Text(widget.place.desciption),
            SizedBox(height: 10),
            Text("OPEN HOURS", style: textTheme.title),
            Text.rich(
              TextSpan(
                children: widget.place.openHours.days
                    .map((day) => TextSpan(text: "$day \n"))
                    .toList(),
              ),
            ),
            Text("ADDITIONAL DETAILS", style: textTheme.title),
            SizedBox(height: 5),
            buildInfoRow(
              Icons.place,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.place.address.street),
                    TextSpan(text: "\n"),
                    TextSpan(text: widget.place.address.postIndex),
                    TextSpan(text: "\n"),
                    TextSpan(text: widget.place.address.city),
                    TextSpan(text: "\n"),
                    TextSpan(text: widget.place.address.country),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            buildInfoRow(Icons.phone, Text(widget.place.mobileNumber)),
            SizedBox(height: 10),
            buildInfoRow(Icons.email, Text(widget.place.email)),
            SizedBox(height: 10),
            Text("SOCIAL MEDIA", style: textTheme.title),
            SizedBox(height: 10),
            buildSocialRow(),
          ],
        ),
      ),
    );
  }

  Row buildSocialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        CircularButton(
            color: Color(widget.place.colorSettings.headerColorHex),
            child: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
            ),
            onPressed: () async {
              await launchURL(widget.place.social.facebook);
            }),
        SizedBox(width: 10),
        CircularButton(
            color: Color(widget.place.colorSettings.headerColorHex),
            child: Icon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
            ),
            onPressed: () async {
              await launchURL(widget.place.social.instagram);
            }),
        SizedBox(width: 10),
        CircularButton(
            color: Color(widget.place.colorSettings.headerColorHex),
            child: Padding(
              padding: const EdgeInsets.only(right: 3.0),
              child: Icon(
                FontAwesomeIcons.tripadvisor,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              await launchURL(widget.place.social.tripadvisor);
            }),
      ],
    );
  }

  Widget buildInfoRow(IconData iconData, Widget child) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Icon(iconData),
          ),
        ),
        Expanded(flex: 4, child: child)
      ],
    );
  }
}
