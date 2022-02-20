import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/screens/layouts/default_layout.dart';
import 'package:parikapp_supervisor/screens/reports/agent_reports.dart';
import 'package:parikapp_supervisor/widgets/navbar.dart';
import 'package:parikapp_supervisor/widgets/sidebar.dart';
import 'package:parikapp_supervisor/widgets/text_field.dart';

class Agents extends StatefulWidget {
  static const routeName = "/agents";
  const Agents({Key? key}) : super(key: key);

  @override
  _AgentsState createState() => _AgentsState();
}

class _AgentsState extends State<Agents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        name: "Agents",
      ),
      drawer: SidebarWidget(),
      body: DefaultLayout(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextInput(
                hintText: "Search",
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: InkWell(
                onTap: () =>
                    {Navigator.of(context).pushNamed(AgentReports.routeName)},
                child: Card(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey.shade100),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Doe  -  #12345",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "0781234567",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
