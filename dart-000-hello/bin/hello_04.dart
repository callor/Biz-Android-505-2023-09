void main(List<String> args) {
  final numA = 30;
  final numB = 40;
  addNums(numA, numB);

  final sum = sumNums(numA, numB);
  print(sum);

  /// Dart의 final 선언문과 const 선언문
  /// final 선언문은 java, 일반적인 프로그래밍 언어의 final 적인 성질을 갖는
  /// 변수 선언문이다. 한번 값을 할당(set) 하면 다시 값을 변경할수 없다
  /// const 선언문은 겉보기는 final 과 유사하게 한번 값을 할당(set)하면
  /// 다시 값을 변경(set) 할수 없다.
  /// 또한, const 선언문은 함수의 return 값을 받을수 없다
  /// const 선언문은 코드가 실행되기 전에 확정적인 값을 저장하는 용도이다
  /// C/C++ 언어의 #define 명령문과 같은 성질이다.
  ///
  /// 매직 리터럴 : "" 로 묶인 문자열, 직접 사용한 숫자값 등
  /// 매직 리터럴은 실제 코드가 작동되는 과정에서 오류를 일으킬수 있는
  /// 정황을 가지고 있다. 그래서 이러한 매직 리터럴을 final 형식의 변수에
  /// 저장하고 조금이라도 오류가 나는 것을 방지하는 방법이 사용된다.
  ///
  /// Dart 에서는 매직 리터럴 값을 저장하는 변수에는 const 선언문을 부착한다
  ///
  /// const 선언문은 코드가 실행되기 전에 값이 확정적인 경우에 사용하는
  /// 키워드 이다
  ///
  const int sumS = 30 + 40;
  print(sumS);
  // const int sumC = sumNums(30, 40);
}

void addNums(int num1, int num2) {
  print("${num1 + num2}");
}

int sumNums(int num1, int num2) {
  return num1 + num2;
}
