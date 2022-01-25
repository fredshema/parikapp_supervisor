import 'package:flutter/material.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';
import '../../widgets/vehicle_owner/register_owner_form.dart';

class RegisterOwner extends StatefulWidget {
  static const String routeName = "/register_owner";

  const RegisterOwner({Key? key}) : super(key: key);

  @override
  _RegisterOwnerState createState() => _RegisterOwnerState();
}

class _RegisterOwnerState extends State<RegisterOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(name: "Register a vehicle"),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: Variables.deviceHeight(context),
              minHeight: Variables.deviceHeight(context),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Vehicle Owner Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text("Provide only vehicle owner's information"),
                const SizedBox(height: 20),
                RegisterOwnerForm(),
                // vehicle owner form
              ],
            ),
          ),
        ),
      ),
    );
  }
}
