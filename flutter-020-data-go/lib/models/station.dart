import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class Station {
  String? STATION_NUM; //레코드 구분	5	1	1
  String? BUSSTOP_ID; //정류소 ID	5	1	2513
  String? BUSSTOP_NAME; //정류소 명(국문)	30	1	동원촌
  String? NAME_E; //정류소 명(영문)	60	1	Dongwonchon
  String? LONGITUDE; //	위도	13	1	126.82839444

  Station({
    this.STATION_NUM,
    this.BUSSTOP_ID,
    this.BUSSTOP_NAME,
    this.NAME_E,
    this.LONGITUDE,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'STATION_NUM': STATION_NUM,
      'BUSSTOP_ID': BUSSTOP_ID,
      'BUSSTOP_NAME': BUSSTOP_NAME,
      'NAME_E': NAME_E,
      'LONGITUDE': LONGITUDE,
    };
  }

  factory Station.fromMap(Map<String, dynamic> map) {
    return Station(
      STATION_NUM:
          map['STATION_NUM'] != null ? map['STATION_NUM'] as String : null,
      BUSSTOP_ID:
          map['BUSSTOP_ID'] != null ? map['BUSSTOP_ID'] as String : null,
      BUSSTOP_NAME:
          map['BUSSTOP_NAME'] != null ? map['BUSSTOP_NAME'] as String : null,
      NAME_E: map['NAME_E'] != null ? map['NAME_E'] as String : null,
      LONGITUDE: map['LONGITUDE'] != null ? map['LONGITUDE'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Station.fromJson(String source) =>
      Station.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Station(STATION_NUM: $STATION_NUM, BUSSTOP_ID: $BUSSTOP_ID, BUSSTOP_NAME: $BUSSTOP_NAME, NAME_E: $NAME_E, LONGITUDE: $LONGITUDE)';
  }
}
