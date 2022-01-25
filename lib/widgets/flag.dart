import 'package:circle_flags/circle_flags.dart';
import 'package:flutter/material.dart';

class Flag extends StatelessWidget {
  final String code;
  final String text;

  const Flag({Key? key, required this.code, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleFlag(
            code,
            size: 40,
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 13),
          )
        ],
      ),
    );
  }
}
