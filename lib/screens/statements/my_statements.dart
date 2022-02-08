import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/vehicle_owner/register_owner.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import 'package:parikapp_driver/widgets/statement_card.dart';
import 'package:parikapp_driver/widgets/textField.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';

class MyStatements extends StatefulWidget {
  static const String routeName = "/statements/mine";

  const MyStatements({Key? key}) : super(key: key);

  @override
  _MyStatementsState createState() => _MyStatementsState();
}

class _MyStatementsState extends State<MyStatements> {
  List<Map<String, dynamic>> statements = [
    {
      "tranx_type": "Payment",
      "description": "Regular parking time",
      "amount": "100 Rwf",
      "date": "02/02/2022",
    },
    {
      "tranx_type": "Charge",
      "description": "Regular parking time",
      "amount": "100 Rwf",
      "date": "02/02/2022",
    },
    {
      "tranx_type": "Charge",
      "description": "Regular parking time",
      "amount": "100 Rwf",
      "date": "04/02/2022",
    },
    {
      "tranx_type": "Payment",
      "description": "Regular parking time",
      "amount": "100 Rwf",
      "date": "01/02/2022",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: Navbar(name: "Statements"),
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
                    ...statements
                        .map((statement) => StatementCard(statement: statement))
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
