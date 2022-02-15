import 'package:flutter/material.dart';

class DeleteVehicleModal extends StatefulWidget {
  final Map<String, dynamic> vehicle;

  const DeleteVehicleModal({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<DeleteVehicleModal> createState() => _DeleteVehicleModalState();
}

class _DeleteVehicleModalState extends State<DeleteVehicleModal> {
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

  @override
  Widget build(BuildContext context) {
    Widget vehicleDetails() {
      return Container(
        padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
        child: Column(
          children: [
            const Icon(
              Icons.delete_forever,
              size: 60,
              color: Colors.redAccent,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "RAA 123 A",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
              child: Text(
                "Are you sure you want to remove this vehicle?",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.redAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              child: ElevatedButton(
                onPressed: () => {Navigator.pop(context)},
                child: const Text("Yes"),
                style: ElevatedButton.styleFrom(primary: Colors.redAccent),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () => {Navigator.pop(context)},
                child: const Text("No"),
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
              ),
            )
          ],
        ),
      );
    }

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
                      decoration: const BoxDecoration(color: Colors.redAccent),
                      child: const Text(
                        "Remove Vehicle",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  vehicleDetails(),
                ],
              )),
        ),
      ],
    );
  }
}
