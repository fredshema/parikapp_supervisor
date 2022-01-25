import 'package:flutter/material.dart';

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
              padding: EdgeInsets.only(top: 70, bottom: 20),
              child: Text(
                "ParikApp need to be activated so only your device can use it.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter your phone number",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone Number Required';
                  }
                },
              ),
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
