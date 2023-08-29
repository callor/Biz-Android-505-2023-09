void main(List<String> args) {
  for (int i = 0; i < 10; i++) {
    print(i);
  }

  int sum = 0;
  for (int i = 0; i < 10; i++) {
    sum += (i + 1);
  }
  print("합계 : $sum");

  sum = 0;
  for (var i = 0; i < 10; i++) {
    int num = i + 1;
    if (num % 2 == 0) sum += num;
  }
  print("짝수의 합 : $sum");
  print("짝수의 합 : " + sum.toString());

  List<int> nums = [];
  for (int i = 0; i < 45; i++) {
    nums.add(i + 1);
  }
  nums.shuffle();
  String out = "";
  for (int i = 0; i < 6; i++) {
    out += "${nums[i]}\t";
  }
  print(out);
}
