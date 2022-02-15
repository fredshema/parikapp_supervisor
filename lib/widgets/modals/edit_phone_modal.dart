import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/layout_widget.dart';
import 'package:parikapp_driver/widgets/navbar.dart';
import 'package:parikapp_driver/widgets/text_field.dart';

class EditPhoneModal extends StatelessWidget {
  VoidCallback generateOtp;

  EditPhoneModal({Key? key, required this.generateOtp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        name: "Edit Linked Number",
      ),
      body: LayoutWidget(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Change Linked Phone Number",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "To change the number associated with this App you need to activate a new phone number so only your device can use it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: TextInput(
                  hintText: "Phone number",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ElevatedButton(
                  onPressed: () => {generateOtp()},
                  child: const Text("CONTINUE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
