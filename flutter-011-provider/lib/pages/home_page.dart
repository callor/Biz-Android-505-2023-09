import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui_models/timer_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String _formatTime(seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    context.select((value) => null);
    // context.watch();
    // context.read();

    var strTimer = context.select<TimerViewModel, String>(
      (value) => _formatTime(value.timerDto.timer),
    );
    var timerRun = context.select<TimerViewModel, bool>(
      (value) => value.timerDto.timerRun,
    );
    var onPressed = context.select<TimerViewModel, Function()>(
      (value) => value.onPressed,
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Stack(
          children: [
            Text(
              strTimer,
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.w900,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 5
                    ..color = Colors.blue),
            ),
            Text(strTimer,
                style: const TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w900,
                    color: Colors.amber)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 100,
        height: 100,
        child: FloatingActionButton(
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onPressed: onPressed,
          backgroundColor: Colors.white38,
          isExtended: true,
          child: Icon(timerRun ? Icons.pause : Icons.play_arrow_rounded,
              size: 60, color: Colors.black),
        ),
      ),
    );
  }
}
