import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/textField.dart';

enum IdType { passport, nationalId }

class RegisterOwnerForm extends StatefulWidget {
  const RegisterOwnerForm({Key? key}) : super(key: key);

  @override
  State<RegisterOwnerForm> createState() => _RegisterOwnerFormState();
}

class _RegisterOwnerFormState extends State<RegisterOwnerForm> {
  IdType _selectedIdType = IdType.nationalId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: "Full names",
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: "Phone number",
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: "Email address",
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                      title: const Text('National ID'),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      dense: false,
                      value: IdType.nationalId,
                      groupValue: _selectedIdType,
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          _selectedIdType = value as IdType;
                        });
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      title: const Text('Passport'),
                      dense: false,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      value: IdType.passport,
                      groupValue: _selectedIdType,
                      onChanged: (value) {
                        setState(() {
                          _selectedIdType = value as IdType;
                        });
                      }),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: _selectedIdType == IdType.nationalId
                    ? "National Id Number"
                    : "Passport Number",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: _selectedIdType == IdType.nationalId
                    ? "Take National Id Picture"
                    : "Take Passport Picture",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text("CONTINUE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
