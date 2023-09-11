// ignore_for_file: use_build_context_synchronously

import 'package:firebase/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
    required this.authUser,
    required this.updateAuthUser,
  });
  final Function(User? user) updateAuthUser;
  final User? authUser;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final User? _authUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("마이페이지"),
          actions: [
            IconButton(
              onPressed: () async {
                Navigator.pop(context);
                await FirebaseAuth.instance.signOut();
                widget.updateAuthUser(null);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Center(
          child: widget.authUser != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("로그인한 사용자 ${_authUser!.email}"),
                    Text("로그인한 UserId ${_authUser!.uid}"),
                  ],
                )
              : SimpleDialog(
                  title: const Text(
                    "로그인이 필요한 서비스 입니다",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: ElevatedButton(
                        /// Navigator.push() : 현재 화면 위에 새로운 화면을 올리기
                        ///   새로 push 된 화면에서 pop 을 실행하면
                        ///     현재 화면이 나타 난다
                        /// Navigator.pushReplacement :
                        ///   현재 화면 pop 한 후에 새로운
                        ///   화면을 push
                        ///   새로 push 된 화면에서 pop 을 실행하면
                        ///     이전 화면이 나타난다
                        onPressed: () async {
                          var result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                                updateAuthUser: widget.updateAuthUser,
                              ),
                            ),
                          );
                          if (result) {
                            Navigator.pop(context);
                          }
                        },
                        child: const Text("로그인"),
                      ),
                    )
                  ],
                ),
        ));
  }
}
