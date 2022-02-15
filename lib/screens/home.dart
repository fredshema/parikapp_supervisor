import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/tickets/buy_ticket.dart';
import 'package:parikapp_driver/screens/vehicle_owner/register_owner.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import 'package:parikapp_driver/widgets/tickets/parking_status.dart';
import '../widgets/navbar.dart';
import '../widgets/ticket_card.dart';

class Home extends StatefulWidget {
  static String routeName = "/home";
  const Home({Key? key, this.showParkingStatus}) : super(key: key);

  final bool? showParkingStatus;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;

  Map<String, dynamic> parkingTime = {
    "plate_number": "RAA 123 A",
    "parking_lot": "Parking Spot 1",
    "duration": const Duration(minutes: 1),
  };

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

    return Scaffold(
      appBar: Navbar(),
      drawer: const SidebarWidget(),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0.0, 1.8),
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Colors.white
            ],
            tileMode: TileMode.decal,
          ),
        ),
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
                  width: 300,
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
                  child: const Image(
                      image: AssetImage("assets/images/logo-big.png")),
                ),
                Column(
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "John Doe",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    widget.showParkingStatus ?? false
                        ? ParkingStatus(parkingTime: parkingTime)
                        : const Text(""),
                    const TicketCard(
                      icon: Icons.confirmation_num,
                      text: "Buy Parking Time",
                      path: BuyTicket.routeName,
                    ),
                    const TicketCard(
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
