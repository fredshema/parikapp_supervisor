import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/vehicles/edit_vehicle.dart';
import 'package:parikapp_driver/widgets/vehicle/delete_vehicle_modal.dart';
import 'package:parikapp_driver/widgets/vehicle/view_vehicle_modal.dart';

class VehicleCard extends StatelessWidget {
  final Map<String, dynamic> vehicle;
  const VehicleCard({Key? key, required this.vehicle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoidCallback showVehicleDetails(vehicle) {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return ViewVehicleModal(
              vehicle: vehicle,
            );
          });
      return () => {};
    }

    VoidCallback editVehicleDetails(vehicle) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EditVehicle(vehicle: vehicle)));
      return () => {};
    }

    VoidCallback deleteVehicleDetails(vehicle) {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return DeleteVehicleModal(
              vehicle: vehicle,
            );
          });
      return () => {};
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: InkWell(
          onTap: () => {showVehicleDetails(vehicle)},
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "TIN :  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text("${vehicle["tin"]}"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Owner :  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text("${vehicle["owner"]}"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Plate number :  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text("${vehicle["plate"]}"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => {editVehicleDetails(vehicle)},
                        child: Container(
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.yellow, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          margin: const EdgeInsets.only(bottom: 5),
                          width: double.maxFinite,
                          child: Column(
                            children: const [
                              Text(
                                "EDIT",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => {deleteVehicleDetails(vehicle)},
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 10),
                          width: double.maxFinite,
                          child: Column(
                            children: const [
                              Text(
                                "DELETE",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
