import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mview/ui_models/page_view_model.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    var setTimer = context
        .select<TimerViewModel, Function(int)>((value) => value.setTimer);
    var pageViewModel = context.watch<PageViewModel>();

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              hintText: "타이머 입력",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setTimer(int.parse(textController.text));
              // 0 번 page 로 되돌아 가기
              pageViewModel.bottomNavTap(0);
              // 키보드 감추기
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: const Text("저장"),
          ),
        ],
      )),
    );
  }
}
