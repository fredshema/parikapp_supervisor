import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/input_select.dart';
import 'package:parikapp_driver/widgets/layout_widget.dart';
import 'package:parikapp_driver/widgets/navbar.dart';
import 'package:parikapp_driver/widgets/text_field.dart';

enum VehicleOwnership { owner, representative }

class EditVehicle extends StatefulWidget {
  static const routeName = "/vehicle/edit";

  final Map<String, dynamic> vehicle;

  const EditVehicle({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<EditVehicle> createState() => _EditVehicleState();
}

class _EditVehicleState extends State<EditVehicle> {
  @override
  void initState() {
    super.initState();
  }

  final Map<String, dynamic> ownerInfo = {
    "name": "John Doe",
    "phone": "0781111111",
    "email": "john@doe.com",
    "id_type": "National ID",
    "id_number": "1 1880 8 1234567 1 12"
  };

  List<String> vehicleTypes = ["Toyota", "Mitsubishi"];

  String vehicleType = "Toyota";

  @override
  Widget build(BuildContext context) {
    void setVehicleType(type) {
      setState(() {
        vehicleType = type;
      });
    }

    @override
    Widget vehicleDetails() {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vehicle Type:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  InputSelect(
                    onChanged: (String? value) => {setVehicleType(value)},
                    value: vehicleType.isEmpty ? vehicleTypes[0] : vehicleType,
                    items: vehicleTypes,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vehicle Brand:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  InputSelect(
                    onChanged: (String? value) => {setVehicleType(value)},
                    value: vehicleType.isEmpty ? vehicleTypes[0] : vehicleType,
                    items: vehicleTypes,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Vehicle Model:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  InputSelect(
                    onChanged: (String? value) => {setVehicleType(value)},
                    value: vehicleType.isEmpty ? vehicleTypes[0] : vehicleType,
                    items: vehicleTypes,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: "Vehicle Plate number",
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextInput(
                hintText: "Vehicle TIN number",
              ),
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "NOTE :  ",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Flexible(
                    child: Text(
                  "Be aware that the providing wrong information is punishable by the law. Modified Information willbe suggested to verification",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ))
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: Navbar(
        name: "Edit vehicle",
      ),
      body: LayoutWidget(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const Text(
                "Edit Vehicle Details",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              vehicleDetails(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text("CANCEL"),
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () => {Navigator.pop(context)},
                  child: const Text("UPDATE"),
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).colorScheme.primary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
