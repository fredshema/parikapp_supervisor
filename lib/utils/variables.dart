import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class Variables {
  static deviceHeight(context) {
    return MediaQuery.of(context).size.height -
        Navbar().preferredSize.height -
        MediaQuery.of(context).viewInsets.top -
        32;
  }

  static deviceWidth(context) {
    return MediaQuery.of(context).size.width;
  }
}
