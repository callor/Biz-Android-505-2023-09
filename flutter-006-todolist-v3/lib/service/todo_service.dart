import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// 안드로이드, iPhone 에는 공통으로 SQLite 라는 RDBMS 가 내장되어 있다
/// 규모는 매우 작지만 phone 에서 DB 를 SQL 을 사용하여 관리할수 있도록
/// 여러가지 명령어를 제공한다
/// 기본적인 기능만으로는 다소 사용이 불편하여 sqflite.dart 를 사용하여
/// 관리한다
class TodoService {
  late Database _database;

  Future<Database> initDatabase() {
    // 실제 phone 의 DB 가 저장되는 경로(path) 가져오기
    String dbPath = getDatabasesPath();
    var dbFile = join(dbPath, "todo.dbf");
  }

  // Future<Database> get database async {
  //   // _database = await
  // }
}
