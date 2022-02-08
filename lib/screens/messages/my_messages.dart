import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/message_card.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import 'package:parikapp_driver/widgets/textField.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';

class MyMessages extends StatefulWidget {
  static const String routeName = "/messages/mine";

  const MyMessages({Key? key}) : super(key: key);

  @override
  _MyMessagesState createState() => _MyMessagesState();
}

class _MyMessagesState extends State<MyMessages> {
  List<Map<String, dynamic>> messages = [
    {
      "message":
          "Your Parking time is close to exceed, Please buy more parking time",
      "date": "02/02/2022",
    },
    {
      "message":
          "Your Parking time is close to exceed, Please buy more parking time",
      "date": "02/02/2022",
    },
    {
      "message":
          "Your Parking time is close to exceed, Please buy more parking time",
      "date": "02/02/2022",
    },
    {
      "message":
          "Your Parking time is close to exceed, Please buy more parking time",
      "date": "02/02/2022",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: Navbar(name: "Messages"),
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
                    ...messages.map((message) => MessageCard(message: message))
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
