class NaverBookDto {
  String? title; //	String	책 제목
  String? link; //	String	네이버 도서 정보 URL
  String? image; //	String	섬네일 이미지의 URL
  String? author; //	String	저자 이름
  String? discount; //	Integer	판매 가격. 절판 등의 이유로 가격이 없으면 값을 반환하지 않습니다.
  String? publisher; //	String	출판사
  String? isbn; //	Integer	ISBN
  String? description; //	String	네이버 도서의 책 소개
  String? pubdate; //	dateTime	출간일
  NaverBookDto({
    this.title,
    this.link,
    this.image,
    this.author,
    this.discount,
    this.publisher,
    this.isbn,
    this.description,
    this.pubdate,
  });

  // jsonToDto(jsonToMap)
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = {};
    data["title"] = title;
    data["link"] = link;
    data["image"] = image;
    data["author"] = author;
    data["discount"] = discount;
    data["publisher"] = publisher;
    data["isbn"] = isbn;
    data["description"] = description;
    data["pubdate"] = pubdate;
    return data;
  }

  // DtoToJson(FromMap)
  NaverBookDto.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    link = json["link"];
    image = json["image"];
    author = json["author"];
    discount = json["discount"];
    publisher = json["publisher"];
    isbn = json["isbn"];
    description = json["description"];
    pubdate = json["pubdate"];
  }

  @override
  String toString() {
    var result = """$title,
                $link,
                $image,
                $author,
                $discount,
                $publisher,
                $isbn,
                $description,
                $pubdate,""";
    return result;
  }
}
