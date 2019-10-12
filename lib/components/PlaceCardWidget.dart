import 'package:explorer/constants.dart';
import 'package:explorer/models.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class PlaceCardWidget extends StatefulWidget {
  const PlaceCardWidget({
    Key key,
    this.place,
    this.onTap,
  }) : super(key: key);

  final Place place;
  final Function onTap;

  @override
  _PlaceCardWidgetState createState() => _PlaceCardWidgetState();
}

class _PlaceCardWidgetState extends State<PlaceCardWidget>
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
        child: GestureDetector(
          onTap: this.widget.onTap,
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
                        itemCount: widget.place.images.length,
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
                                  image: widget.place.images[index],
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
                          Text(widget.place.name, style: textTheme.title),
                          Text(
                            widget.place.address.shortAddress,
                            style: textTheme.subtitle.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Opens at " +
                                  widget.place.openHours.opensTodayFrom(),
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
        ),
      ),
    );
  }
}
