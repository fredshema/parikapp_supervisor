import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/widgets/text_field.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback logged_in;

  LoginForm({Key? key, required this.logged_in}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: TextInput(hintText: "Enter your Phone number"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: TextInput(hintText: "Enter your PIN"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: ElevatedButton(
                onPressed: () => {logged_in()},
                child: const Text("LOGIN"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
