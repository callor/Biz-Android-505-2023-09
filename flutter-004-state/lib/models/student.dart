class Student {
  // String? stNum 에서 ? 의 역할, stNum 라는 변수에 null 을 허용하겠다
  String? stNum;
  String stName;

  /// Student 클래스를 사용하여 객체를 만들때 stNum 와 stName 값을
  /// 반드시 전달해야 한다
  Student({this.stNum, required this.stName});
}
