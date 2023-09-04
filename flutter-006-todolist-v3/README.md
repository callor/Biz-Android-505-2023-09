# TodoList 프로젝트

- 날짜 시간 등을 처리할 Dependency 를 add 하기
- `intl` 은 날짜 시간 `locale`, 화폐단위 등을 처리할때 사용하는 여러가지 함수를 지원하는 도구

```bash
flutter pub get intl
```

## persistance 설정

- 영속적 Data 관리
- DBMS 나 File 에 데이터를 저장하여 app 이 종료되어도 그 값을 유지하도록 하는 것
- phone 에 기본적으로 내장된 DBMS 를 사용하기 : `SqLite`를 사용하여 data 를 저장하기

```bash
flutter pub add sqflite
flutter pub add path
```
