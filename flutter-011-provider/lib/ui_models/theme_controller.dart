import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// flutter dart 에서 클래스(인터페이스)를 상속받을때
/// extends : 일반적인 클래스를 상속받을때
/// mixin : 한개의 클래스와 두개 이상의 인터페이스를 동시에 상속받을때
/// with : 현재는 한개의 클래스를 상속받지만 , ChangeNotifier 가
/// 자체적으로 상속받았던 클래스, 인터페이스를 모두 상속받기
class ThemeController with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  /// ThemeMode 클래스를 사용한 객체 선언
  /// flutter 에서 meterial3 의 theme를 쉽게 변경할수 있도록
  /// 미리 준비해둔 클래스
  late ThemeMode _themeMode; // private 변수

  // private 변수를 외부에서 참조할수 있는 getter 함수 선언
  ThemeMode get themeMode => _themeMode;

  Future<void> initSystemTheme() async {
    _themeMode = ThemeMode.system;
    notifyListeners();
  }

  Future<void> loadTheme() async {
    final SharedPreferences prefs = await _prefs;
    var themeStr = prefs.getString("THEME");
    ThemeMode themeMode = ThemeMode.system;
    if (themeStr == ThemeMode.dark.toString()) {
      themeMode = ThemeMode.dark;
    } else if (themeStr == ThemeMode.light.toString()) {
      themeMode = ThemeMode.light;
    }
    // _themeMode = themeMode;
    updateThemeMode(themeMode);
    notifyListeners();
  }

  ThemeController() {
    loadTheme();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (_themeMode == newThemeMode) return;
    _themeMode = newThemeMode;

    final SharedPreferences prefs = await _prefs;
    var result = await prefs.setString("THEME", newThemeMode.toString());
    if (!result) {
      debugPrint("저장 실패!!");
    }
    notifyListeners();
  }
}
