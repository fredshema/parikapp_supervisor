import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/tickets/buy_ticket.dart';
import 'package:parikapp_driver/screens/vehicle_owner/register_owner.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import 'package:parikapp_driver/widgets/tickets/parking_status.dart';
import '../widgets/navbar.dart';
import '../widgets/activation_code_modal.dart';
import '../widgets/ticket_card.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height -
        Navbar().preferredSize.height -
        MediaQuery.of(context).viewInsets.top -
        32;

    VoidCallback _showActivationCodeModal() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return const ActivationCodeModal();
          });
      return () => {};
    }

    return Scaffold(
      appBar: Navbar(),
      drawer: const SidebarWidget(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0.0, 1.2),
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Colors.white
            ],
            tileMode: TileMode.decal,
          ),
        ),
        // height: deviceHeight,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: deviceHeight,
              minHeight: deviceHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 320,
                  padding: const EdgeInsets.only(top: 30),
                  child: const Image(
                      image: AssetImage("assets/images/logo-big.png")),
                ),
                const SizedBox(height: 30),
                Column(
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    ParkingStatus(),
                    TicketCard(
                      icon: Icons.confirmation_num,
                      text: "Buy Parking Time",
                      path: BuyTicket.routeName,
                    ),
                    TicketCard(
                      icon: Icons.directions_car,
                      text: "Register a vehicle",
                      path: RegisterOwner.routeName,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
