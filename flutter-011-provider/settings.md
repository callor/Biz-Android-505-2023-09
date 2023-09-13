# 어플을 사용하는 과정에서 어플의 상태설정, 어떤 값의 설정 하기

- 어플을 설정하는 데이터는 실제로 매우 작은 용량이다
- 다소 큰 데이터는 DB 를 사용하거나, 파일을 사용하여 생성하지만, 작은 데이터는 `shared preference` 라고 하는 스마트기기의 작은 저장공간에 데이터를 보관한다.
- `SP(shared preference)`는 어플의 작은 설정등을 저장하고, 어플을 종료해도 스마트기기에 영속적으로 보관이 된다.
- 다만 어플을 삭제하면 이 데이터는 어플과 함께 소멸된다.
- 어플을 삭제하지 않고 데이터를 삭제하려면 `설정`에서 데이터만 삭제할수 있다.
- 개발자 입장에서 어플의 버전을 변경하면 기존의 데이터가 초기화 된다
- Web의 `localStorage`와 유사한 개념으로 보면된다.

## Sp 를 어플에서 사용하기

- dependecy 설정 : `flutter pub add settings_ui`, `flutter pub add shared_preferences` , `flutter pub add settings_ui shared_preferences`
