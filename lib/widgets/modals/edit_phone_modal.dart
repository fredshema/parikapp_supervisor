import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/textField.dart';

class EditPhoneModal extends StatelessWidget {
  VoidCallback generateOtp;

  EditPhoneModal({Key? key, required this.generateOtp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(color: Colors.orange),
                    child: const Text(
                      "Edit Linked Phone number",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Text(
                          "To change the number associated with this App you need to activate a new phone number so only your device can use it.",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: TextInput(
                          hintText: "Phone number",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: ElevatedButton(
                    onPressed: () => {generateOtp()},
                    child: const Text("CONTINUE"),
                    style: ElevatedButton.styleFrom(primary: Colors.orange),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
