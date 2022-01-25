import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/inputSelect.dart';
import 'package:parikapp_driver/widgets/textField.dart';

enum VehicleOwnership { owner, representative }

class RegisterVehicleForm extends StatefulWidget {
  const RegisterVehicleForm({Key? key}) : super(key: key);

  @override
  State<RegisterVehicleForm> createState() => _RegisterVehicleFormState();
}

class _RegisterVehicleFormState extends State<RegisterVehicleForm> {
  VehicleOwnership _selectedOwnership = VehicleOwnership.owner;

  List<String> vehicleTypes = ["Toyota", "Mitsubishi"];

  String vehicleType = "Toyota";

  void setVehicleType(type) {
    setState(() {
      vehicleType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 340,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile(
                      title: const Text('Owner'),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      dense: true,
                      value: VehicleOwnership.owner,
                      groupValue: _selectedOwnership,
                      autofocus: true,
                      onChanged: (value) {
                        setState(() {
                          _selectedOwnership = value as VehicleOwnership;
                        });
                      }),
                ),
                Expanded(
                  child: RadioListTile(
                      title: const Text('Owner Representative'),
                      dense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 0,
                        vertical: 10,
                      ),
                      value: VehicleOwnership.representative,
                      groupValue: _selectedOwnership,
                      onChanged: (value) {
                        setState(() {
                          _selectedOwnership = value as VehicleOwnership;
                        });
                      }),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 25),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black, width: 1),
                ),
              ),
            ),
            const Text(
              "Add Vehicles",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 5),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Card(
                    margin: EdgeInsets.all(0),
                    color: Colors.grey.shade600,
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "1 / 1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                      onPressed: () => {},
                      child: const Text(
                        "Add Vehicle",
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: const EdgeInsets.all(10),
                        primary: Colors.grey.shade600,
                      )),
                )
              ],
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
