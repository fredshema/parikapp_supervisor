import 'package:flutter/material.dart';

class ViewVehicleModal extends StatefulWidget {
  final Map<String, dynamic> vehicle;

  const ViewVehicleModal({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<ViewVehicleModal> createState() => _ViewVehicleModalState();
}

class _ViewVehicleModalState extends State<ViewVehicleModal> {
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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Vehicle Owner Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text(
                    "Names : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text("${ownerInfo["name"]}"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text(
                    "Phone : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text("${ownerInfo["phone"]}"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text(
                    "Email : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text("${ownerInfo["email"]}"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text(
                    "IDentification : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text("${ownerInfo["id_type"]}"),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  const Text(
                    "ID Number : ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text("${ownerInfo["id_number"]}"),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Vehicle Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Text(
                      "TIN : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text("${widget.vehicle["tin"]}"),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Text(
                      "Owner : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text("${widget.vehicle["owner"]}"),
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    const Text(
                      "Plate number : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text("${widget.vehicle["plate"]}"),
                    )
                  ],
                )),
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
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary),
                      child: const Text(
                        "Vehicle Details",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  vehicleDetails(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ElevatedButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: const Text("CLOSE"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ),
      ],
    );
  }
}
