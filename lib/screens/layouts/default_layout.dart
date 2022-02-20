import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/utils/variables.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const DefaultLayout(
      {Key? key, required this.child, this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: Variables.deviceHeight(context),
            maxWidth: Variables.deviceWidth(context),
          ),
          child: Padding(
            padding: padding,
            child: child,
          ),
        ),
      ),
    );
  }
}
