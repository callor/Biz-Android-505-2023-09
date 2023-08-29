void main(List<String> args) {
  int num1 = 20;
  int num2 = 30;
  // String interpolation, 문자열과 연산식을 동시에 표현하는 방법
  print("$num1, $num2");
  print("${num1 + num2}");
  print("${num1 / num2}");

  String nation1 = "대한민국";
  String nation2 = "우리나라";

  String korea = "$nation1 은 $nation2";
  print(korea);
}
