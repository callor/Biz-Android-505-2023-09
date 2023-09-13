import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/timer_dto.dart';

/// provider 를 활용한 ViewModel 패턴을 적용하기 위하여
/// ViewModel 클래스를 선언한다
/// ChangeNotifier 라는 클래스를 상속받아서 작성한다

/// state 변수는 State<> 클래스에서 선언하고
/// 값을 변화시키려면 setState() 함수를 통하여 실행했다
/// provider 를 활용한 MVVM 패턴에서는 state 값을 변화시키는 코드를
/// ChangNotifier 를 상속받은 ViewModel 클래스에서 실행한다
class TimerViewModel extends ChangeNotifier {
  /// final Future<SharedPreferences> _prefs = SharedPreferences()
  /// 일반적인 클래스는 생성자를 호출하여 객체(인스턴스)를 생성한다.
  /// 클래스로 객체(인스턴스)를 생성하면(new) 각각 생성되는 인스턴스는 독립적이다
  /// 객체지향에서 한개의 객체(인스턴스)를 만들고, 프로젝트 전체에서
  /// 공통으로 공유를 해야 하는 경우가 있다.
  /// 그럴때 static 을 사용하기도 하지만, 싱글톤이라는 패턴(기법)을 사용하여
  /// 이미 생성된 객체를 재활용(다시 이용)하는 방법이 있다.
  /// static(프로젝트 start 되면 자동으로 객체 생성)에 비해서
  /// 필요한 경우만  객체를 한번 생성하여 재활용 한다는 의미에서
  /// static 에 비하여 메모리 효율성을 기대할수 있다
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // viewModel 의 state 변수
  var timerDto = TimerDto();
  int initTimer = 25 * 60;

  // 변수이름(식별자)에 _ 가 부착되면 이변수는 private 성질을 띈다
  // async 패키지에 포함된 객체
  late Timer _timer;

  Future<int> getTimer() async {
    // 이 클래스에서 만들어진 _prefs 객체를 private 으로 사용하기 위하여
    // 요구하기
    final SharedPreferences prefs = await _prefs;
    // localStorage(SP)에 TIMER 라는 이름으로 변수가 저장되어 있으면
    // 정수형으로 변환하여 timer 변수에 담아달라
    var timer = prefs.getInt("TIMER");
    if (timer != null) {
      timerDto.timer = timer;
      initTimer = timer;
    } else {
      timerDto.timer = 25 * 60;
    }
    notifyListeners();
    return timerDto.timer;
  }

  TimerViewModel() {
    getTimer();
  }

  void setTimer(timer) async {
    timerDto.timer = timer;
    final SharedPreferences prefs = await _prefs;
    // SP 에 TIMER 라는 이름으로 설정된 타이머 시작값 저장하기
    var result = await prefs.setInt("TIMER", timer);
    if (!result) {
      debugPrint("저장 실패");
    }
    notifyListeners();
  }

  // timeerDto state 변수의 값을 변화시키는 함수
  void onPressed() {
    timerDto.timerRun = !timerDto.timerRun;

    if (timerDto.timerRun) {
      /// Timer.periodic(시간값, 함수())
      /// 시간값이 경과할때다마 함수() 를 실행한다.
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        timerDto.timer--;
        if (timerDto.timer < 1) {
          timerDto.timer = 300;
          timerDto.timerRun = false;
          timer.cancel();
        }

        /// viewModel 에서 state 변수값을 변화 시켰으니
        /// 화면에 그려라 라는 통보
        /// State<> 클래스에서 setState() 함수를 실행시키는 것과 유사
        notifyListeners();
      });
    } else {
      _timer.cancel();
    }
    notifyListeners();
  }
}
