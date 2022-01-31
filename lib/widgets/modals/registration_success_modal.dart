import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/vehicles/my_vehicles.dart';

class RegistrationSuccessModal extends StatefulWidget {
  const RegistrationSuccessModal({Key? key}) : super(key: key);

  @override
  State<RegistrationSuccessModal> createState() =>
      _RegistrationSuccessModalState();
}

class _RegistrationSuccessModalState extends State<RegistrationSuccessModal> {
  bool isActivated = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isActivated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget registrationSuccess() {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              size: 60,
              color: Colors.green,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Registration Complete",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                "Your vehicle(s) is/are now registered. You can start using your vehicle(s) plate numbers to buy parking time with ParikApp",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pop(context),
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MyVehicles.routeName, (_) => false)
                },
                child: const Text("CLOSE"),
                style: ElevatedButton.styleFrom(primary: Colors.green),
              ),
            )
          ],
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: const BoxDecoration(color: Colors.green),
                      child: const Text(
                        "Registration Success",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  registrationSuccess(),
                ],
              )),
        ),
      ],
    );
  }
}
