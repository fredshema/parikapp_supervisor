import 'package:flutter/material.dart';
import 'package:parikapp_driver/utils/custom_colors.dart';

class Navbar extends AppBar {
 final TextStyle textStyle;

  Navbar(
      {String name = "ParikApp", this.textStyle = const TextStyle(), Key? key})
      : super(
          key: key,
          toolbarHeight: 75,
          backgroundColor: CustomColor.PRIMARY,
          title: Text(
            name,
            style: textStyle,
          ),
          elevation: 0.0,
          bottomOpacity: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.live_help_rounded),
              onPressed: () => {},
            ),
          ],
        );
}
