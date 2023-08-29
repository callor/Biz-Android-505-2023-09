import 'models/Student.dart';

void main(List<String> args) {
  Student str1 = Student();
  str1.stNum = 1;
  str1.stName = "홍길동";
  str1.stGrade = 3;
  str1.stDept = "컴퓨터공학";
  print(str1.toString());
}
