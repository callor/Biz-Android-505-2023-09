import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/email_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/user_input.dart';

import '../models/user.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My PAGE")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("여기는 마이 페이지 입니다"),
          ElevatedButton(
            onPressed: () async {
              var userDto = User(
                username: "이몽룡",
                password: "9999999",
                nickname: "암행어사",
                tel: "010-1111-111",
                email: "callor@callor.com",
              );
              var result = await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserInput(userDto: userDto),
              ));

              var resultStr = """
                username = ${result.username},
                password = ${result.password},
                nickname = ${result.nickname},
              """;
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(resultStr),
                  duration: const Duration(seconds: 5),
                ),
              );
            },
            child: const Text("정보수정"),
          )
        ],
      )),
    );
  }
}
