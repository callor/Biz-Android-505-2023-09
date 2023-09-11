import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.updateAuthUser,
  });
  // main.dart 에 선언된 _authUser 변수를 update 할 함수 사용할 준비
  final Function(User? user) updateAuthUser;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emainInputFocus = FocusNode();
  final _passwordInputFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("로그인이 필요합니다", style: TextStyle(fontSize: 20)),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _emainInputFocus,
                    onChanged: (value) => _emailValue = value,
                  ),
                  TextFormField(
                    focusNode: _passwordInputFocus,
                    onChanged: (value) => _passwordValue = value,
                  ),
                  ElevatedButton(
                    child: const Text("로그인"),
                    onPressed: () async {
                      try {
                        if (_formKey.currentState!.validate()) {
                          // 로그인에 성공하면 result 에 사용자 정보가 담기게 된다
                          var result = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: _emailValue,
                            password: _passwordValue,
                          );
                          // main.dart 의 _authUser State 에 로그인한 사용자 정보
                          // Update 요청하기
                          widget.updateAuthUser(result.user);
                          // 화면전환, SnackBar 등을 화면에 표현하고자 할때
                          // Don't use BuildContext ... 의 경고가 나타나면
                          // 아래의 코드를 먼저 실행하도록 추가한다
                          // BuildContext(context) 가 아직 완전히 생성되지 않거나
                          // 어떤 이유로 context 가 사라질수 도 있는데
                          // 사용상 주의하라 라는 경고.
                          // mounted 라는 시스템 변수가 생성되었는지 확인 한후
                          // context 관련 코드를 실행하라 라는 의미
                          if (!mounted) return;
                          Navigator.of(context).pop();
                        }
                      } on FirebaseAuthException {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("")),
                        );
                      }
                    },
                  )
                ],
              ))
        ],
      )),
    );
  }
}
