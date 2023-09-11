// ignore_for_file: use_build_context_synchronously

import 'package:firebase/modules/validate.dart';
import 'package:firebase/pages/join_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../modules/input_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.updateAuthUser});
  // State<> 클래스 위젯에 함수를 전달하기 위하여 선언하기
  final Function(User? user) updateAuthUser;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TextFormField 에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("로그인")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputFormField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailCheck(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "이메일",
                  helpText: "이메일을 형식에 맞게 입력해 주세요"),
              inputFormField(
                focusNode: _passwordFocus,
                hintText: "비밀번호",
                helpText: "비밀번호는 특수문자, 영문자, 숫자 포함 8자 이상으로 입력해 주세요",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate().passwordCheck(
                  password: value!,
                  focusNode: _passwordFocus,
                ),
              ),
              // 로그인 버튼
              loginButton(),
              // 회원가입 버튼
              joinButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget joinButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                JoinPage(updateAuthUser: widget.updateAuthUser),
          ));
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "회원가입",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: _emailValue,
            password: _passwordValue,
          );
          //      result.user != null ? true : false
          // Navigator.pop(context,데이터) : 현재 화면이 닫힐때
          // 현재 화면을 열었던 곳으로 `데이터` 를 return
          Navigator.pop(context, result.user != null);
          await widget.updateAuthUser(result.user);
          // setState(() {});
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "로그인",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
