import 'package:flutter/material.dart';

class SelectCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final String path;

  const SelectCard(
      {Key? key, required this.icon, required this.text, this.path = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () => {
          if (path != "") {Navigator.of(context).pushNamed(path)}
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 60,
                ),
                const SizedBox(height: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
