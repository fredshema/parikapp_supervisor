import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/screens/agent/assignment_success.dart';
import 'package:parikapp_supervisor/screens/layouts/default_layout.dart';
import 'package:parikapp_supervisor/widgets/input_select.dart';
import 'package:parikapp_supervisor/widgets/navbar.dart';
import 'package:parikapp_supervisor/widgets/text_field.dart';

class AssignAgent extends StatefulWidget {
  static const String routeName = "/agent/assign";

  const AssignAgent({Key? key}) : super(key: key);

  @override
  _AssignAgentState createState() => _AssignAgentState();
}

class _AssignAgentState extends State<AssignAgent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        name: "Agent Assignment",
      ),
      body: DefaultLayout(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Agent To Supervise:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    InputSelect(
                      onChanged: (String? value) => {},
                      value: "1",
                      items: [],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Parking Spots for Agent:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 3),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: TextInput(
                              hintText: "Search Parking Spot",
                            ),
                          ),
                          parkingSpotCard("Parking Spot 1"),
                          parkingSpotCard("Parking Spot 2"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: ElevatedButton(
                  onPressed: () => {
                    showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        builder: (builder) {
                          return AssignmentSucess();
                        })
                  },
                  child: const Text("CONFIRM"),
                ),
              )
            ],
          )),
    );
  }

  Widget parkingSpotCard(parkingName) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            parkingName,
            style: TextStyle(fontSize: 16),
          ),
          InkWell(
            child: Icon(Icons.close),
          )
        ],
      ),
    );
  }
}
