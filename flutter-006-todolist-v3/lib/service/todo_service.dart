import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist/models/todo.dart';

// ignore: constant_identifier_names
const String TBL_TODO = "tbl_todoList";

/// 안드로이드, iPhone 에는 공통으로 SQLite 라는 RDBMS 가 내장되어 있다
/// 규모는 매우 작지만 phone 에서 DB 를 SQL 을 사용하여 관리할수 있도록
/// 여러가지 명령어를 제공한다
/// 기본적인 기능만으로는 다소 사용이 불편하여 sqflite.dart 를 사용하여
/// 관리한다
class TodoService {
  /// 변수 이름에 under score 를 붙이면 이 변수는 private 이라는 의미
  /// late 키워드는 아직 변수를 초기화 시키지 않았지만
  /// 이 값은 null 이 아니다 라는 선언
  /// 즉, 곧 이 변수는 누군가가 초기화(값 부여)를 할 것이다
  late Database _database;
  final String createTABLE = """
    CREATE TABLE $TBL_TODO  (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sdate TEXT, 
        stime TEXT,
        content TEXT,
        complete INTEGER
    )
  """;

  /// Future
  /// 함수(method)의 return type 으로 사용하는 키워드
  /// 이 함수는 언젠가 실행될 것이고, return 값이 null 아 아니다 라는 선언
  /// JS Promise 키워드와 같은 역할을 한다.
  /// 비동기 방식 함수에 주로 사용한다.
  Future<void> onCreateTable(db, version) async {
    return db.execute(createTABLE);
  }

  Future<void> onUpgradeTable(db, oldVersion, newVersion) async {
    if (newVersion > oldVersion) {
      final db = await database;
      final batch = db.batch();
      batch.execute("DROP TABLE $TBL_TODO");
      batch.execute(createTABLE);
      await batch.commit();
    }
  }

  Future<Database> initDatabase() async {
    // 실제 phone 의 DB 가 저장되는 경로(path) 가져오기
    String dbPath = await getDatabasesPath();
    // 저장될 database 파일을 설정
    var dbFile = join(dbPath, "todo.dbf");
    return await openDatabase(
      dbFile,
      onCreate: onCreateTable,
      onUpgrade: onUpgradeTable,
      version: 5,
    );
  }

  /// _database private 변수를 외부에서 사용하기 위한 getter method
  Future<Database> get database async {
    _database = await initDatabase();
    return _database;
  }

  Future<int> insert(Todo todo) async {
    final db = await database;
    final result = await db.insert(TBL_TODO, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    debugPrintThrottled(result.toString());

    return result;
  }

  /// where : "id = ${id}" , id = "1 = 1 OR "
  /// SQL 을 사용할때 문자열 연결방식으로 WHERE 절을 사용하면 절대 안된다
  /// SQL Injection 공격에 바로 노출될수 있다
  /// 만약 이처럼 코드를 작성했을 때 where : "id = ${id}" ,
  /// id 변수에 "1 = 1 OR " 와 같은 코드를 전달하면 Table 의 모든 데이터가
  /// 한꺼번에 삭제되는 결과가 발생한다
  Future<int> delete(int id) async {
    final db = await database;
    return await db.delete(
      TBL_TODO,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Todo todo) async {
    final db = await database;
    return db.update(
      TBL_TODO,
      todo.toMap(),
      where: "id = ? ",
      whereArgs: [todo.id],
    );
  }

  /// 비동기 방식으로 select 하여 데이터를 return 하고 있다
  Future<List<Todo>> selectAll() async {
    final db = await database;
    final List<Map<String, dynamic>> todoList = await db.query(TBL_TODO);

    // select 한 데이터( resultSet )를 List<Todo> 로 변환하기
    return List.generate(
      todoList.length,
      (index) => Todo(
        id: todoList[index]["id"],
        sdate: todoList[index]["sdate"],
        stime: todoList[index]["stime"],
        content: todoList[index]["content"],
        complete: todoList[index]["complete"] == 1 ? true : false,
      ),
    );
  }
}
