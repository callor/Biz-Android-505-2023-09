import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state/models/student.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: "Flutter State",
        theme: ThemeData(primarySwatch: Colors.green),
        home: const HomePage());
  }
}

/// State 클래스를 관리하는 부모 클래스
/// State 를 생성(create) 한다
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  /// => StartPage()
  /// StartPage class 의 생성자를 호출하여 StartPage 의 객체를 생성하여
  /// return 하라 라는 의미
  @override
  State<StatefulWidget> createState() => StartPage();
}

/// State Widget 에서는 StatefulWidget 과 관계를 명확하기 위하여
/// Generic(<HomePage>)을 연결하여 준다
class StartPage extends State<HomePage> {
  /// State 클래스 위젯에서 titles 배열 변수를 생성(선언과 초기화)
  /// 이 순간 titles 는 state 가 된다.
  /// state : 화면 rendering, 또는 동적인 활동을 감시할수 있는 동적 변수
  final titles = [
    "Hello Korea",
    "안녕하세요",
    "반갑습니다",
    "우리나라만세",
    "대한민국 만세",
    "Republic of Korea"
  ];

  final studentList = [
    Student(stNum: "001", stName: "홍길동"),
    Student(stNum: "002", stName: "이몽룡"),
    Student(stNum: "003", stName: "성춘향"),
    Student(stNum: "004", stName: "임꺽정"),
    Student(stNum: "005", stName: "장보고"),
    Student(stNum: "006", stName: "장녹수"),
  ];

  List<Student> filterList = [];

  /// 동적으로 변화되는 배열(리스트) 요소들을 화면에 출력하기 위하여
  /// ListView.builder() 함수를 사용하여 각 요소를 디자인한다
  ListView appBarBody() => ListView.builder(
        itemCount: filterList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Material(
              child: InkWell(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text(filterList[index].stName),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                highlightColor:
                    const Color.fromARGB(255, 117, 28, 201).withOpacity(0.5),
                splashColor:
                    const Color.fromARGB(255, 139, 241, 22).withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(filterList[index].stNum ?? ""),
                      Text(filterList[index].stName),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  void _onChangeHandler(String search) {
    List<Student> result = [];
    if (search.isNotEmpty) {
      result =
          studentList.where((item) => item.stName.contains(search)).toList();
    } else {
      result = studentList;
    }
    setState(() {
      filterList = result;
    });
  }

  /// state 가 최초에 mount 될때
  @override
  void initState() {
    filterList = studentList;
    super.initState();
  }

  // state 가 unmount 될때
  // 일부 context 에 저장된 변수들을 사용 해제 해야할 경우가 있는데
  // 이때 여기에 그러한 코드를 작성한다
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕하세요"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              var rnd = Random().nextDouble();

              /// flutter 의 State 클래스에서 기본으로 제공하는 함수
              /// state 로 선언된 변수의 값을 변경할때 사용하는 함수
              /// 이 함수내의 본문에서 state 변수의 값(상태)을 변경하면
              /// 화면에 자동 rendering 이 된다.
              setState(() {
                titles.add(rnd.toString());
              });
            },
            icon: const Icon(Icons.add_alert_outlined),
          )
        ],
      ), // mainAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: _onChangeHandler, //(value) => _onChangeHandler(value),
              decoration: const InputDecoration(
                  labelText: "Search",
                  labelStyle: TextStyle(fontSize: 20),
                  hintText: "검색어를 입력하세요",
                  hintStyle: TextStyle(color: Colors.blue),
                  prefixIcon: Icon(
                    Icons.search,
                  )),
            ),

            const SizedBox(
              height: 20,
            ),
            // ListView 를 사용하여 list 보이기
            // Expanded 실행하여 Column box 에 가득차게 구현
            Expanded(
                child: filterList.isNotEmpty
                    ? appBarBody()
                    : const Text(
                        "찾는 값이 없음",
                        style: TextStyle(fontSize: 25),
                      )),
          ],
        ),
      ),
    );
  }
}
