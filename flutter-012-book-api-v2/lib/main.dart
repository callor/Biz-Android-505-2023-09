import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import './api/naver_open_api.dart';
import './models/naver_book_dto.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ViewBooksPage(),
    );
  }
}

class ViewBooksPage extends StatefulWidget {
  const ViewBooksPage({super.key});
  @override
  State<ViewBooksPage> createState() => _ViewBooksPageState();
}

class _ViewBooksPageState extends State<ViewBooksPage> {
  // Future<List<NaverBookDto>>
  Future<List<NaverBookDto>>? resultBooks = NaverOpenAPI().loadBooks();

  // resultBooks state 변수를 변화시키는 함수
  // search 라는 매개변수에 전달된 값을 받아서
  void searchBooks(String search) {
    if (search.isEmpty) return;

    // NaverOpenAPI().loadBooks() 에게 전달하고, 검색어에 해당하는
    // 결과를 return 받기
    Future<List<NaverBookDto>>? searchResultBooks =
        NaverOpenAPI().loadBooks(search);

    // return 받은 결과를  resultBooks state 변수에 반영하여
    // List 화면을 다시 그리기
    setState(() {
      resultBooks = searchResultBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("RESULT ${resultBooks == null}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchBox(searchBooks: searchBooks),
      ),
      body: ViewListPage(resultBooks: resultBooks),
    );
  }
}

class SearchBox extends StatelessWidget {
  SearchBox({
    super.key,
    required this.searchBooks,
  });
  final Function(String search) searchBooks;
  final searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          child: TextField(
            controller: searchInputController,
            // keyboardType: TextInputType.text,
            // 입력 키보드에 검색 버튼이 나타나도록 설정하기
            textInputAction: TextInputAction.search,
            // 키보드의 검색 버튼을 클릭했을때 실행할 함수
            onSubmitted: (value) => searchBooks(value),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "검색어",
              hintText: "도서 검색어를 입력하세요",
            ),
          ),
        ),
      ],
    );
  }
}

class ViewListPage extends StatelessWidget {
  const ViewListPage({
    super.key,
    required this.resultBooks,
  });

  final Future<List<NaverBookDto>>? resultBooks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // Future<List<Dto>> type 의 데이터들을 사용하여
      // 화면에 보여질 Widget 을 생성하는 도구
      child: FutureBuilder(
        future: resultBooks,
        // FutureBuilder 가 resultBooks 데이터를 사용하여 List 데이터로
        // 변환을 학고, 그 데이터를 다시 ListView.builder 에게 전달하여
        // 실제로 화면에 보여질 List 를 생성한다
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            // ListView.builder 는 리스트의 각 항목(한개 데이터)들을
            // ListTile 에게 전달하여 한개 데이터를 표현할 View 를 만들고
            // 그들을 모아서 리스트로 보여준다
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(12),
              child: BookItemView(bookItem: snapshot.data![index]),
            ),
          );
        },
      ),
    );
  }
}

class BookItemView extends StatelessWidget {
  const BookItemView({
    super.key,
    required this.bookItem,
  });
  final NaverBookDto bookItem;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Image.network(bookItem.image!),
      title: Text(bookItem.title!),
      subtitle: Text(bookItem.author!),
      children: [
        paddingText(
          child: Text(
            bookItem.title!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        paddingText(
          child: Text(bookItem.description!),
        ),
        paddingText(
          child: RichText(
            text: TextSpan(
              text: "네이버 바로가기",
              style: const TextStyle(fontSize: 15, color: Colors.blueAccent),
              recognizer: TapGestureRecognizer()
                ..onTap = () => launchUrl(Uri.parse(bookItem.link!)),
            ),
          ),
        )
      ],
    );
  }

  // 함수로 Widget 를 분리한 후 return type 을 Widget 으로 변환하자
  Widget paddingText({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }
}
