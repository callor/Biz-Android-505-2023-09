import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  var todoList = [];
  final _delConfirm = false;

  // var todoList = [
  //   Todo(
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "오늘은 금요일",
  //     complete: false,
  //   ),
  //   Todo(
  //     sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  //     stime: DateFormat("HH:ss:mm").format(DateTime.now()),
  //     content: "Flutter 프로젝트",
  //     complete: false,
  //   )
  // ];

  Todo getTodo(String content) {
    return Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: content,
      complete: false,
    );
  }

  Widget alertDialog(BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        actions: [
          const TextField(),
          TextField(
            // keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(
                content: Text("$value 가 추가되었음"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해 주세요",
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    // State 클래스 내의 함수를 실행하여 결과를 가져온 후 todoList 를 만든다
    // 이때 클래스 내의 함수를 호출하여 다른 변수를 만드는 경우
    // 이 코드는 build 함수 내부에서 실행해야 한다
    //  todoList.add = [
    //   getTodo("플러터 프로젝트"),
    //   getTodo("오늘은 금요일"),
    //   getTodo("내일은 토요일 뭐할까"),
    // ];

    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          "images/profile.jpg",
          fit: BoxFit.fill,
        ),
        title: const Text("나의 TodoList"),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => alertDialog(context),
                );
              },
              icon: const Icon(
                Icons.add_alarm,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            splashColor:
                const Color.fromARGB(255, 180, 20, 30).withOpacity(0.5),
            title: Dismissible(
              key: Key(todoList[index].content),
              background: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.green,
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.save,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.red,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.delete,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              // 사라지기 전의 event
              confirmDismiss: (direction) {
                return showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text("정말삭제할까요?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text("예"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text("아니오"),
                      ),
                    ],
                  ),
                );
                // return Future.value(_delConfirm);
              },
              // 사라진 후 event
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todoList[index].sdate),
                        Text(todoList[index].stime),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          todoList[index].content,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
