import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/home.dart';

class PaymentSuccessModal extends StatelessWidget {
  const PaymentSuccessModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15.0),
              color: Colors.green,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Payment Successfull",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => {Navigator.of(context).pop()},
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(Icons.check, size: 80, color: Colors.green),
                  const SizedBox(height: 10),
                  const Text(
                    "Payment Successfull",
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "To follow up parking status please continue.",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: ElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).pop(),
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Home(showParkingStatus: true)),
                          (_) => false,
                        )
                      },
                      child: const Text("CONTINUE"),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
