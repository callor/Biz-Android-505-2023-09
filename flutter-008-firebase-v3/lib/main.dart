import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/mypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Android, IOS 의 장치를 통하여 외부 네트워크를 실행하거나
  /// 장치에 부착된 카메라, GPS 등에 접근하기 위하여
  /// Flutter 와 Native 를 연결하는 설정
  /// The following FirebaseException was thrown building Builder:
  /// [core/no-app] No Firebase App '[DEFAULT]' has been created
  ///       - call Firebase.initializeApp()
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});
  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  // _authUser state 선언
  late User? _authUser;

  @override
  void initState() {
    // login 된 사용자 정보를 firebaseAuth 에 요청
    super.initState();
    _authUser = FirebaseAuth.instance.currentUser;
  }

  void updateAuthUser(User? user) {
    setState(() {
      _authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Project")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("반갑습니다.", style: TextStyle(fontSize: 35)),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MyPage(
                    authUser: _authUser,
                    updateAuthUser: updateAuthUser,
                  ),
                ),
              );
            },
            child: const Text("마이페이지"),
          )
        ],
      )),
    );
  }
}
