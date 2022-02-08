import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final VoidCallback? onEnd;
  final Duration duration;
  final Color textColor;
  const TimerWidget(
      {Key? key, this.onEnd, required this.duration, required this.textColor})
      : super(key: key);

  String formatTime(time) {
    return time > 9 ? "$time" : "0$time";
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        tween: Tween(begin: duration, end: Duration.zero),
        onEnd: onEnd,
        duration: duration,
        builder: (BuildContext context, Duration value, Widget? child) {
          final hours = value.inHours;
          final minutes = value.inMinutes;
          final seconds = value.inSeconds % 60;
          return Text(
            '${formatTime(hours)} : ${formatTime(minutes)} : ${formatTime(seconds)}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: textColor),
          );
        });
  }
}
