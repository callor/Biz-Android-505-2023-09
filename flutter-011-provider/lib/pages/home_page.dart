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
    var strTimer = context.select<TimerViewModel, String>(
      (value) => _formatTime(value.timerDto.timer),
    );
    var timerRun = context.select<TimerViewModel, bool>(
      (value) => value.timerDto.timerRun,
    );
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(strTimer),
          ],
        ),
      ),
    );
  }
}
