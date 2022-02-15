import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/text_field.dart';

class ActivationForm extends StatelessWidget {
  VoidCallback generateOtp;

  ActivationForm({Key? key, required this.generateOtp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70, bottom: 40),
              child: Text(
                "ParikApp need to be activated so only your device can use it.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(hintText: "Enter your names"),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(hintText: "Enter your phone number"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () => {generateOtp()},
                child: const Text("ACTIVATE THE APP"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
