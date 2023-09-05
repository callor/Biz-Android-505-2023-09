import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  const EmailPage({super.key});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    /// ModalRoute 객체로 부터 설정값(settings)을 getter 하고
    /// 설정값들 중에서 arguments 값을 getter 하여 args 에 Map type 으로 담아라
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(title: const Text("Email 페이지")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("여기는 Email Page"),
              Text("Email ${args["email"]}"),
              Text("password ${args["password"]}"),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed("/mypage"),
                child: const Text("My Page"),
              )
            ],
          ),
        ));
  }
}
