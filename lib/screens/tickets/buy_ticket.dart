import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/inputSelect.dart';
import 'package:parikapp_driver/widgets/layout_widget.dart';
import 'package:parikapp_driver/widgets/navbar.dart';
import 'package:parikapp_driver/widgets/textField.dart';
import 'package:parikapp_driver/widgets/tickets/awaiting_payment_modal.dart';

class BuyTicket extends StatefulWidget {
  static const routeName = "buy/ticket";

  const BuyTicket({Key? key}) : super(key: key);

  @override
  _BuyTicketState createState() => _BuyTicketState();
}

class _BuyTicketState extends State<BuyTicket> {
  final List<String> parkingTime = [
    "5 Minutes",
    "10 Minutes",
    "30 Minutes",
    "1 Hour",
    "5 Hours",
    "1 Day"
  ];

  final List<String> paymentMethods = ["MTN Mobile Money", "Tigo/Airtel Money"];

  String _selectedParkingTime = "";
  String _selectedPaymentMethod = "";

  @override
  void initState() {
    super.initState();
    _selectedParkingTime = parkingTime[0];
    _selectedPaymentMethod = paymentMethods[0];
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback _showAwaitingPaymentModal() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return const AwaitingPaymentModal();
          });
      return () => {};
    }

    return Scaffold(
      appBar: Navbar(
        name: "Buy Parking Ticket",
      ),
      body: LayoutWidget(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              const Text(
                "Ticket Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextInput(
                  hintText: "Plate number",
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextInput(
                  hintText: "Parking spot Identifier",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Parking Time:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    InputSelect(
                      onChanged: (value) => {},
                      value: _selectedParkingTime.isNotEmpty
                          ? _selectedParkingTime
                          : parkingTime[0],
                      items: parkingTime,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Payment Method:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    InputSelect(
                      onChanged: (value) => {},
                      value: _selectedPaymentMethod.isNotEmpty
                          ? _selectedPaymentMethod
                          : paymentMethods[0],
                      items: paymentMethods,
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: TextInput(
                  hintText: "Mobile Number, eg: 07xxxxxx",
                ),
              ),
              const SizedBox(height: 15),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "NOTE :  ",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Flexible(
                      child: Text(
                    "Please make sure you have you are close to your phone to confirm the transaction.",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: _showAwaitingPaymentModal,
                  child: const Text("CONTINUE"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
