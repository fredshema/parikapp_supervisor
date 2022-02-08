import 'package:flutter/material.dart';

class LayoutWidget extends StatelessWidget {
  final Widget child;
  const LayoutWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: child,
      ),
    );
  }
}
