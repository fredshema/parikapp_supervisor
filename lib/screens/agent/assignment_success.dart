import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/screens/home.dart';

class AssignmentSucess extends StatelessWidget {
  const AssignmentSucess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.green,
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Assignment Successfull",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => {
                            Navigator.of(context).pop(),
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Home.routeName,
                              (route) => false,
                            )
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 60,
                        ),
                        Text(
                          "Assignment Successful",
                          style: TextStyle(fontSize: 18, color: Colors.green),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Assigned Parking spots;",
                          style: TextStyle(fontSize: 15),
                        ),
                        Text.rich(
                          TextSpan(
                              children: [
                                TextSpan(text: "Parking Spot 1\n"),
                                TextSpan(text: "Parking Spot 2"),
                              ],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
