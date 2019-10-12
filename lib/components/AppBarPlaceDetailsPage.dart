import 'package:explorer/constants.dart';
import 'package:explorer/models.dart';
import 'package:flutter/material.dart';
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
    return AppBar(
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        titlePadding: Constants.appBarPadding,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AnimatedPlaceName(place: place),
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

class AnimatedPlaceName extends StatefulWidget {
  const AnimatedPlaceName({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  _AnimatedPlaceNameState createState() => _AnimatedPlaceNameState();
}

class _AnimatedPlaceNameState extends State<AnimatedPlaceName>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation opacityAnim;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    opacityAnim = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return FadeTransition(
      opacity: opacityAnim,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: widget.place.name, style: textTheme.headline),
            TextSpan(text: "\n"),
            TextSpan(text: widget.place.subtitle, style: textTheme.subhead)
          ],
        ),
      ),
    );
  }
}
