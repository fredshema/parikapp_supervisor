import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/screens/layouts/default_layout.dart';
import 'package:parikapp_supervisor/widgets/navbar.dart';

class AgentReports extends StatefulWidget {
  static const String routeName = "/agent/reports";

  const AgentReports({Key? key}) : super(key: key);

  @override
  _AgentReportsState createState() => _AgentReportsState();
}

class _AgentReportsState extends State<AgentReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(name: "Agent Report"),
      body: DefaultLayout(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Text(
                "02/02/2022 00:00 - 03/02/2022 00:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Minimum Time between rotations :  10 Minutes"),
              buildReport("Parking Spot 1"),
              buildReport("Parking Spot 2"),
              buildReport("Parking Spot 3"),
              SizedBox(height: 30),
              Text(
                "02/02/2022 00:00 - 03/02/2022 00:00",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Minimum Time between rotations :  10 Minutes"),
              buildReport("Parking Spot 1"),
              buildReport("Parking Spot 2"),
              buildReport("Parking Spot 3"),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildReport(name) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade100,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            "Rotation Count :  100",
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
