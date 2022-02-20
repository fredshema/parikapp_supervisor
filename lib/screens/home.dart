import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/screens/agent/assign_agent.dart';
import 'package:parikapp_supervisor/screens/layouts/gradient_layout.dart';
import 'package:parikapp_supervisor/screens/reports/agent_reports.dart';
import 'package:parikapp_supervisor/widgets/select_card.dart';
import 'package:parikapp_supervisor/widgets/sidebar.dart';
import '../widgets/navbar.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({Key? key, this.showParkingStatus}) : super(key: key);

  final bool? showParkingStatus;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      drawer: const SidebarWidget(),
      body: GradientLayout(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30, bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Image(
                    image: AssetImage("assets/images/logo-big.png"),
                    height: 80,
                  ),
                  Text(
                    "AGENT",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              ),
            ),
            Column(
              children: [
                const Text(
                  "AGENT 12345",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const SelectCard(
                  icon: Icons.car_repair,
                  text: "Assign Agent To Parking",
                  path: AssignAgent.routeName,
                ),
                const SelectCard(
                  icon: Icons.assignment_ind,
                  text: "Agent Reports",
                  path: AgentReports.routeName,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
