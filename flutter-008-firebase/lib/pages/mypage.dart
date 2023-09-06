import 'package:firebase/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final User? _authUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _authUser == null
          ? const LoginPage()
          : GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                setState(() {});
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("로그인한 사용자 ${_authUser!.email}"),
                    Text("로그인한 UserId ${_authUser!.uid}"),
                  ],
                ),
              ),
            ),
    );
  }
}
