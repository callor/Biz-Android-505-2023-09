import 'package:flutter/material.dart';
import 'package:mview/ui_models/timer_view_model.dart';
import 'package:provider/provider.dart';
import 'package:settings_ui/settings_ui.dart';

import '../ui_models/page_view_model.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  final textEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pageViewModel = context.watch<PageViewModel>();
    var timer = context.watch<TimerViewModel>().timerDto.timer;
    textEditController.text = timer.toString();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "설정",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        leading: IconButton(
            color: Colors.white,
            onPressed: () => pageViewModel.bottomNavTap(0),
            icon: const Icon(
              Icons.arrow_back,
            )),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text("타이머 설정"),
            tiles: [
              SettingsTile(
                leading: const Icon(Icons.timer_outlined),
                title: TextField(
                  controller: textEditController,
                  decoration: const InputDecoration(labelText: "타이머 시작값"),
                ),
              ),
              SettingsTile(
                title: const TextField(
                  decoration: InputDecoration(labelText: "타이머 휴식값"),
                ),
                leading: const Icon(Icons.timer_off_outlined),
              ),
            ],
          ),
          SettingsSection(
            title: const Text("테마 설정"),
            tiles: [
              SettingsTile(title: const Text("타이머")),
              SettingsTile(title: const Text("타이머")),
            ],
          ),
        ],
      ),
    );
  }
}
