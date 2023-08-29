// ignore_for_file: file_names
/// data class(Dto, VO) 클래슷  작성하기
class Student {
  int stNum = 0; // none-nullerble, null 값이 저장될수 없는 변수
  String? stName; // null safe, null 을 저장할수 있도록 허용하는 변수
  String? stDept;
  int? stGrade;

  /// data class 의 기본 생성자 함수
  /// 아래와 같은 코드를 작성하여 매개변수로 받은 데이터를
  /// 내부 변수( this.* ) 에 setting 하는 코드를 작성한다
  // Student({stNum, stName, stDept, stGrade}) {
  //   this.stNum = stNum;
  //   this.stName = stName;
  //   this.stDept = stDept;
  //   this.stGrade = stGrade;
  // }
  /// 현재 버전의 dart 에서는 아래와 같은 단순화된 코드로 작성한다
  /// 다만 stNum 는 null safe(=> String? stName) 가 아니기 때문에
  Student({this.stNum = 0, this.stName, this.stDept, this.stGrade});

  // setter method
  set setStNum(int num) => stNum = num;
  int get getStNum => stNum;

  @override
  String toString() {
    String str = "이름 : $stName,"
        " 학번 : $stNum,"
        " 학과 : $stDept,"
        " 학년 : $stGrade";
    return str;
  }
}
