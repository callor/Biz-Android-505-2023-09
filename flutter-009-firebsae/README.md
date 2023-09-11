## firebase plug in

https://firebase.google.com/docs/flutter/setup?hl=ko&authuser=0&_gl=1*fm6c4k*_ga*ODc3Mzk0NTY0LjE2OTI5MjQ0MDE.*_ga_CW55HF8NVT*MTY5NDM5MTY0My4xNi4xLjE2OTQzOTIwOTcuMC4wLjA.&platform=android#available-plugins

- firebase_core, firebase_auth, cloud_firestore 설치
- `flutter pub add firebase_core firebase_auth 	cloud_firestore`

- 의존성 여부 확인

```bash
flutter pub upgrade outdataed package
flutter clean
flutter pub get
```

## firebase 와 google 로그인 설정하기

- firebase console 에서 Authenticatio 에 google 공급업체 추가하기

## SHA 인증서 확인하기

- `jdk(jre) / bin` 폴더에서 `keytool.exe` 파일 찾기
- keytool 을 사용하여 SHA 인증서 확인하기
- bin 폴더에서 관리자 권한으로 cmd 창 열기

```cmd
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
# 비밀번호 : android
```

- 구글로그인 도구 설치 : `flutter pub add google_sign_in`
