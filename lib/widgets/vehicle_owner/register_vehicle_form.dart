import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/vehicle_owner/confirm_registration_details.dart';
import 'package:parikapp_driver/widgets/input_select.dart';
import 'package:parikapp_driver/widgets/text_field.dart';

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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          showDialog(
                              context: context,
                              useSafeArea: true,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  children: [
                                    const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          "Representer Information",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        )),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: TextInput(
                                        hintText: "Enter representer name",
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: TextInput(
                                        hintText:
                                            "Enter representer phone number",
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: TextInput(
                                        hintText: "Enter representer email",
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: TextInput(
                                        hintText: "Enter owner TIN",
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: TextInput(
                                        hintText:
                                            "Attach document that appoint you to represent vehicles",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: ElevatedButton(
                                        onPressed: () => {
                                          Navigator.of(context).pop(),
                                        },
                                        child: const Text('Submit'),
                                      ),
                                    )
                                  ],
                                );
                              });
                        });
                      }),
                ),
              ],
            ),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Flexible(
            //       child: Card(
            //         margin: const EdgeInsets.all(0),
            //         color: Colors.grey.shade600,
            //         child: const Padding(
            //           padding: EdgeInsets.all(10),
            //           child: Text(
            //             "1 / 1",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ),
            //     Flexible(
            //       child: ElevatedButton(
            //           onPressed: () => {},
            //           child: const Text(
            //             "Add Vehicle",
            //             style: TextStyle(fontSize: 16),
            //           ),
            //           style: ElevatedButton.styleFrom(
            //             minimumSize: Size.zero,
            //             padding: const EdgeInsets.all(10),
            //             primary: Colors.grey.shade600,
            //           )),
            //     )
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.of(context)
                      .pushNamed(ConfirmRegistrationDetails.routeName)
                },
                child: const Text("CONTINUE"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
