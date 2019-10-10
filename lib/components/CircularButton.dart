import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.color = Colors.white,
    this.padding = 15,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final double padding;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipOval(
        child: Container(
          padding: EdgeInsets.all(padding),
          child: child,
          color: color,
        ),
      ),
      onTap: onPressed,
    );
  }
}
