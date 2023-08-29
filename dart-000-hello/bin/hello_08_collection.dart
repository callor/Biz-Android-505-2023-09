// List(배열)
var nums = [1, 2, 4, 5, 6, 7, 8, 9];
var nations = ["대한민국", "미국", "영국", '독일'];
List<String> names = ["홍길동", "이몽룡", "성춘향"];

void main(List<String> args) {
  nums.add(100);
  nations.add("스위스");
  names.add("임꺽정");
  print(nums);
  print(nations);

  // List(배열)에서 특정한 값을 제거하기
  nations.remove("미국");
  print(nations);
  // List 의 3 번 index 요소를 제거하기
  nations.removeAt(3);
  print(nations);

  print(names.first);
  var result = names.first;
  print(names.last);
  result = names.last;
  print(names.reversed);
  var iter = names.reversed;
  print("$result, $iter");

  names.shuffle();
  print(names);
}
