import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

class StationDto {
  num? STATION_NUM; //레코드 구분	5	1	1
  num? BUSSTOP_ID; //정류소 ID	5	1	2513
  String? BUSSTOP_NAME; //정류소 명(국문)	30	1	동원촌
  String? NEXT_BUSSTOP;
  String? NAME_E; //정류소 명(영문)	60	1	Dongwonchon
  num? LONGITUDE; //	위도	13	1	126.82839444

  StationDto({
    this.STATION_NUM,
    this.BUSSTOP_ID,
    this.BUSSTOP_NAME,
    this.NEXT_BUSSTOP,
    this.NAME_E,
    this.LONGITUDE,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'STATION_NUM': STATION_NUM,
      'BUSSTOP_ID': BUSSTOP_ID,
      'BUSSTOP_NAME': BUSSTOP_NAME,
      'NEXT_BUSSTOP': NEXT_BUSSTOP,
      'NAME_E': NAME_E,
      'LONGITUDE': LONGITUDE,
    };
  }

  factory StationDto.fromMap(Map<String, dynamic> map) {
    return StationDto(
      STATION_NUM:
          map['STATION_NUM'] != null ? map['STATION_NUM'] as num : null,
      BUSSTOP_ID: map['BUSSTOP_ID'] != null ? map['BUSSTOP_ID'] as num : null,
      BUSSTOP_NAME:
          map['BUSSTOP_NAME'] != null ? map['BUSSTOP_NAME'] as String : null,
      NEXT_BUSSTOP:
          map['NEXT_BUSSTOP'] != null ? map['NEXT_BUSSTOP'] as String : null,
      NAME_E: map['NAME_E'] != null ? map['NAME_E'] as String : null,
      LONGITUDE: map['LONGITUDE'] != null ? map['LONGITUDE'] as num : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StationDto.fromJson(String source) =>
      StationDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StationDto(STATION_NUM: $STATION_NUM, BUSSTOP_ID: $BUSSTOP_ID, BUSSTOP_NAME: $BUSSTOP_NAME, NEXT_BUSSTOP: $NEXT_BUSSTOP, NAME_E: $NAME_E, LONGITUDE: $LONGITUDE)';
  }
}
