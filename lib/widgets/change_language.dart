import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/widgets/flag.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Center(
            child: Text("Change your Language"),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Flag(code: 'gb', text: 'English'),
              Flag(code: 'rw', text: 'Kinyarwanda'),
              Flag(code: 'fr', text: 'Français'),
            ],
          )
        ],
      ),
    );
  }
}
