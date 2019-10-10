import 'package:explorer/components/CircularButton.dart';
import 'package:flutter/material.dart';

import 'package:explorer/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Constants.appBarColor,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: Constants.appBarPadding,
        title: Row(
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
            CircularButton(
              child: Image.asset(
                'assets/Icons/placeholder.png',
                width: 60,
                height: 60,
              ),
              padding: 0,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Constants.appBarHeight;
}
