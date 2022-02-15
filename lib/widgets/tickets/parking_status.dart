import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/tickets/buy_ticket.dart';
import 'package:parikapp_driver/screens/tickets/pay_penalty.dart';
import 'package:parikapp_driver/widgets/timer_widget.dart';

class ParkingStatus extends StatefulWidget {
  final Map<String, dynamic> parkingTime;
  const ParkingStatus({Key? key, required this.parkingTime}) : super(key: key);

  @override
  _ParkingStatusState createState() => _ParkingStatusState();
}

class _ParkingStatusState extends State<ParkingStatus> {
  Duration duration = const Duration(seconds: 5);
  String timerKey = DateTime.now().toString();
  bool timeEnded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        showDialog(
            context: context,
            useSafeArea: true,
            builder: (BuildContext context) {
              return SimpleDialog(
                contentPadding: const EdgeInsets.all(20),
                children: [
                  const Icon(
                    Icons.notifications_active,
                    size: 80,
                    color: Colors.orange,
                  ),
                  const Text(
                    "Your Parking time",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "00 Hrs : 01 Min : 00 Sec",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Be aware that if your Parking time expires and you did not buy more Parking time and still park after 5 minutes you will get a Penalty",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => {Navigator.of(context).pop()},
                    child: const Text("Leaving the parking lot"),
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => {
                      Navigator.of(context).pop(),
                      Navigator.of(context).pushNamed(timeEnded
                          ? PayPenalty.routeName
                          : BuyTicket.routeName)
                    },
                    child: Text(timeEnded ? 'Pay Penalty' : 'Buy Parking Time'),
                  )
                ],
              );
            })
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.directions_car, size: 40),
                      Text(
                        "RAA 123 A",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "STATUS",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color:
                                timeEnded ? Colors.red : Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: TimerWidget(
                          key: Key(timerKey),
                          duration: widget.parkingTime["duration"],
                          textColor: timeEnded ? Colors.white : Colors.black,
                          onEnd: () {
                            setState(() {
                              timeEnded = true;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      const Icon(Icons.pin_drop, size: 40),
                      RichText(
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "Parking spot 1",
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
