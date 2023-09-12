import 'package:flutter/material.dart';

class PageViewModel extends ChangeNotifier {
  // dto 클래스 처럼 private 속성을 선언하고, getter method 를 선언하기
  final _pageController = PageController(initialPage: 0);
  get pageController => _pageController;

  int _pageIndex = 0;
  get pageIndex => _pageIndex;

  void pageViewChange(newPageIndex) {
    _pageIndex = newPageIndex;
    notifyListeners();
  }

  void bottomNavTap(pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
    notifyListeners();
  }
}
