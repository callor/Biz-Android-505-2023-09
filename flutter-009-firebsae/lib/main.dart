import 'package:firebase/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StartPage());
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // firebase auth 통하여 로그인된 사용자 정보를 담을 state 변수
  late User? _authUser;

  // State 초기화 함수에서 firebase auth 를 통하여 로그인된 사용자 정보를 가져와
  // _authUser 변수에 담아둔다
  @override
  void initState() {
    super.initState();
    _authUser = FirebaseAuth.instance.currentUser;
  }

  // _authUser state 를 update(변화)할 함수 선언
  void updateAuthUser(User? user) {
    setState(() {
      _authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _authUser != null
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("로그인한 사용자 email : ${_authUser?.email}"),
                ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    setState(() {
                      updateAuthUser(null);
                    });
                  },
                  child: const Text("로그아웃"),
                )
              ],
            ))
          : SimpleDialog(
              title: const Text("로그인이 필요합니다"),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPage(
                        updateAuthUser: updateAuthUser,
                      ),
                    )),
                    child: const Text("로그인 하기"),
                  ),
                ),
              ],
            ),
    );
  }
}
