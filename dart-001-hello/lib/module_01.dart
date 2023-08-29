// 1개의 문자열을 전달받아 문장을 만들어서 return 하는 화살표 함수
String nation(String nation) => "우리나라는 $nation 입니다";
// 2개의 정수값을 전달받아 덧셈을 수행한 후 return 하는 함수
int addNums(int num1, int num2) {
  return num1 + num2;
}

// 정수형 배열을 전달받아 모든 요소의 값을 합산하여 return 하는 함수
int sumNums(List<int> nums) {
  int sum = 0;
  for (var num in nums) {
    sum += num;
  }
  return sum;
}
