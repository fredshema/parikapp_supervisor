import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/home.dart';
import 'package:parikapp_driver/screens/vehicle_owner/register_owner.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import 'package:parikapp_driver/widgets/textField.dart';
import 'package:parikapp_driver/widgets/vehicle_card.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';
import '../../widgets/vehicle_owner/register_vehicle_form.dart';

class MyVehicles extends StatefulWidget {
  static const String routeName = "/vehicles/mine";

  const MyVehicles({Key? key}) : super(key: key);

  @override
  _MyVehiclesState createState() => _MyVehiclesState();
}

class _MyVehiclesState extends State<MyVehicles> {
  List<Map<String, dynamic>> vehicles = [
    {
      "plate": "RAA 123 A",
      "tin": "1234567",
      "owner": "I am the owner",
    },
    {
      "plate": "RAA 123 A",
      "tin": "1234567",
      "owner": "I am the owner",
    },
    {
      "plate": "RAA 124 A",
      "tin": "1234567",
      "owner": "I Represent the owner (MTN)",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: Navbar(name: "My Vehicles"),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            {Navigator.of(context).pushNamed(RegisterOwner.routeName)},
        child: const Icon(Icons.add, size: 40),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Variables.deviceHeight(context),
            ),
            child: IntrinsicHeight(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: TextInput(
                        hintText: "Search",
                      ),
                    ),
                    ...vehicles.map((vehicle) => VehicleCard(vehicle: vehicle))
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
