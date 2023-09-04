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
  /// **Controller
  /// flutter 의 대부분의 Widget 에는 위젯Controler 라는  객체가 있다
  /// HTML 의 id 속성에 해당하는 객체이다
  var inputController = TextEditingController();
  var todoContent = "";
  var todoList = [];
  Todo getTodo(String content) {
    return Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: content,
      complete: false,
    );
  }

  /// Scaffold
  /// 처음 화면의 layout 을 꾸밀때 사용하는 Widget이다
  /// appBar, body, bottomSheet 가 있는데
  /// appBar 는 화면의 머릿글에 해당하는 부분
  /// body 는 본문(중앙)에 해당하는 부분
  /// bottomSheet 는 화면의 footer(꼬릿글)에 해당하는 부분
  /// body 는 보통 데이터를 표현하는 부분, 여긴 Scroll 이 일어나는 부분
  /// appBar, bottomSheet 는 body 가 변화되더라도 Scroll 이 되지 않는 부분
  /// bttomSheet 는 입력화면에서 소프트 키보드가 나타 나면 키보드 위에
  ///     표현되는 부분
  @override
  Widget build(BuildContext context) {
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
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  // TextField 에 id(Controller) 를 설정하기
                  controller: inputController,
                  onChanged: (value) => setState(() {
                    todoContent = value;
                  }),
                  decoration: InputDecoration(
                    prefix: const SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => inputController.clear,
                      icon: const Icon(Icons.clear),
                    ),
                    hintText: "할일을 입력해 주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send_outlined),
              )
            ],
          ),
        ),
      ),
      body: todoListView(),
    );
  }

  /// ListView return type 을 Widget으로 변경하기
  /// 모든 Widget 은 가장 상위 클래스인 Widget 을 상속받고 있기 때문에
  /// 모든 Widget 의 return type 은 Widget 으로 설정하여도 된다
  Widget todoListView() {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          splashColor: const Color.fromARGB(255, 180, 20, 30).withOpacity(0.5),
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
}
