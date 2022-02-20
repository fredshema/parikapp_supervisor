import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/utils/variables.dart';

class GradientLayout extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const GradientLayout(
      {Key? key, required this.child, this.padding = const EdgeInsets.all(0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0.0, 1.2),
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Colors.white
            ],
            tileMode: TileMode.decal,
          ),
        ),
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
      ),
    );
  }
}
