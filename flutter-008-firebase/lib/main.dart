import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/login_page.dart';
import 'package:firebase/pages/mypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Android, IOS 의 장치를 통하여 외부 네트워크를 실행하거나
  /// 장치에 부착된 카메라, GPS 등에 접근하기 위하여
  /// Flutter 와 Native 를 연결하는 설정
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: MyPage(),
      ),
    );
  }
}
