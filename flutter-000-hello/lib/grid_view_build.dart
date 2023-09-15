import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({
    super.key,
  });

  final List<Map<String, dynamic>> frogList = [
    {"name": "참개구리", "color": Colors.blue, "image": "참구리이미지"},
    {"name": "금개구리", "color": Colors.blue, "image": "금구리이미지"},
    {"name": "청개구리", "color": Colors.blue, "image": "청구리이미지"},
    {"name": "맹꽁이", "color": Colors.blue, "image": "맹꽁이이미지"}
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  _MainPageState();
  String? frogName;
  Color? frogColor;

  @override
  void initState() {
    var index = Random().nextInt(widget.frogList.length);
    frogName = widget.frogList[index]["name"];
    debugPrint("Frog Name : $frogName");
    frogColor = Colors.blue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Expanded(
            child: GridView.builder(
              itemCount: widget.frogList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                childAspectRatio: 1, //item 의 가로 1, 세로 2 의 비율
                mainAxisSpacing: 10, //수평 Padding
                crossAxisSpacing: 10, //수직 Padding
              ),
              itemBuilder: (context, index) => GestureDetector(
                key: ValueKey(widget.frogList[index]),
                onLongPress: () {
                  if (frogName == widget.frogList[index]["name"]) {
                    setState(() {
                      widget.frogList[index]["color"] = Colors.green;
                      widget.frogList[index]["name"] =
                          widget.frogList[index]["image"];
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("틀렸습니다.$frogName"),
                      ),
                    );
                  }
                },
                child: Container(
                  color: widget.frogList[index]["color"],
                  width: 100,
                  height: 100,
                  child: Text(widget.frogList[index]["name"]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
