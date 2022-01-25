import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hintText;

  const TextInput({Key? key, this.hintText = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is Required';
        }
      },
    );
  }
}
