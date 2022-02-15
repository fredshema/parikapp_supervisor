import 'dart:async';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:parikapp_driver/widgets/tickets/payment_successfull_modal.dart';

class AwaitingPaymentModal extends StatelessWidget {
  const AwaitingPaymentModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context).pop();
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return const PaymentSuccessModal();
          });
    });

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
              color: Theme.of(context).colorScheme.primary,
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      "Awaiting Payment",
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
                children: const [
                  GFLoader(size: GFSize.LARGE),
                  SizedBox(height: 10),
                  Text(
                    "Waiting Transaction Processing",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Please make sure you confirm your transaction on the popup message that appear on your device.",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Once your transaction is processed you will receive a confirmation message.",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
