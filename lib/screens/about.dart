import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';

class About extends StatefulWidget {
  static const String routeName = "/about";

  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: Navbar(name: "About The App"),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Variables.deviceHeight(context),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "About ParikApp",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "ParikApp is a smarts parking application from Kigali city office that helps citizens to manage their vehicles by parking easily and quickly, hence avoiding traffic jams and congestion in Kigali city.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "It is managed by MISIC and has been developed and designed by Galaxy group LTD.",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Container(
                          child: const Icon(Icons.share, size: 35),
                          margin: const EdgeInsets.symmetric(horizontal: 5)),
                      Container(
                          child: const Icon(Icons.facebook, size: 35),
                          margin: const EdgeInsets.symmetric(horizontal: 5)),
                      Container(
                          child: const Icon(Icons.public, size: 35),
                          margin: const EdgeInsets.symmetric(horizontal: 5)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text("ParikApp V1.3 Build 2112"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
