import 'package:flutter/material.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';
import '../../widgets/vehicle_owner/register_vehicle_form.dart';

class RegisterVehicleDetails extends StatefulWidget {
  static const String routeName = "/register/vehicle";

  const RegisterVehicleDetails({Key? key}) : super(key: key);

  @override
  _RegisterVehicleDetailsState createState() => _RegisterVehicleDetailsState();
}

class _RegisterVehicleDetailsState extends State<RegisterVehicleDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(name: "Register a vehicle"),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Variables.deviceHeight(context),
            ),
            child: IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      "Vehicle Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text("Provide only vehicle information"),
                    SizedBox(height: 20),
                    RegisterVehicleForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
