import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class TicketStatus extends StatefulWidget {
  final toggleTicketVisibility;
  const TicketStatus({Key? key, required this.toggleTicketVisibility})
      : super(key: key);

  @override
  _TicketStatusState createState() => _TicketStatusState();
}

class _TicketStatusState extends State<TicketStatus> {
  @override
  Widget build(BuildContext context) {
    return GFAlert(
      type: GFAlertType.rounded,
      bottombar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          GFButton(
            onPressed: () => {widget.toggleTicketVisibility(false)},
            shape: GFButtonShape.pills,
            child: const Text(
              'Close',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
