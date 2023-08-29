import 'package:dart_hello/module_02.dart';

void main(List<String> args) {
  // 위치기반(positional parameters) 함수 호출
  // sayHello() 함수를 호출하면서 3개의 값을 전달한다
  // 이때 sayHello() 함수에 선언된 3개의 매개변수에 순서대로 값이 저장되어
  //    전달된다
  var result = sayHello("홍길동", 22, "대한민국");
  print(result);

  /// named parameter 방식
  /// 함수를 선언할때 매개변수를 {} 로 감싸주고
  /// 값을 전달할때 변수:값 형식으로 전달한다
  /// 위치기반에 비하여 함수에 값이 잘못 전달 되는 것을 방지 할수 있다
  result = sayHelloNameParams(age: 33, nation: "우리나라", name: "성춘향");
  print(result);

  /// named parameter 방식의 함수를 선언할때 변수 type 에 null safe( ? )를
  /// 지정하면 변수값을 선택적으로 보내거나 보내지 않아도 된다.
  /// 이러한 방식을 Optional Parameter 라고 한다
  result = sayHelloNameParams(name: "이몽룡");
  print(result);
}
