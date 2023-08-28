# Biz-2023-505-Android

- Android Project
- @since 2023-08-28

## Flutter 설치

- 설치파일 다운로드 : `flutter.dev` 사이트에서 `Get Started` 접속하여 `fluttter*.zip` 다운로드
- `c:\dev` 폴더에 파일 이동후 압축 풀기
- 압축 해제된 폴더에서 `flutter` 폴더를 `c:\dev` 폴더로 이동
- windows 의 고급설정보기에서 환경변수 path 항목에 `c:\dev\flutter\bin` 폴더 추가하기

## flutter extention 설치

- vsCode 확장 plugin 설치 : flutter 검색하여 설치

## flutter project 생성

```bash
flutter create --org=com.callor hello
```

## 프로젝트 명명 주의

- 만약 다음과 같이 프로젝트이름을 생성하면 base-packcage 가  
  `com.callor.flutter-000-hello-01` 처럼 생성이 되어 버린다
- 프로젝트 이름은 짧은 Key 값으로 생성하고 이후에 프로젝트폴더 이름을 변경해 주는 것이 파일 관리가 유리하다
- 프로젝트 이름은 가급적 소문자로 작성한다
-

```bash
flutter create --org=com.callor flutter-000-hello-01

```

## flutter 개발환경 설정 : 사용준비, 기존의 다른 도구들과 연결하기

- flutter 야 내 컴퓨터에 여러가지 도구가 있는데 그들과 연결을 해라

```bash
flutter doctor
```

- flutter doctor 를 실행한 후 Android toolchain 경고가 나오면 다음을 실행한다

```bash
flutter doctor --android-licenses
```
