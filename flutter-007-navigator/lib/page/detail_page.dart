import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.userDto,
  });
  final String name;
  final String email;
  final User userDto;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자세히 보기"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 자세히 보기 페이지 입니다"),
            Text("이름 : ${widget.name}"),
            Text("Email : ${widget.email}"),
            Text("username : ${widget.userDto.username}"),
            Text("password : ${widget.userDto.password}"),
            Text("nickname : ${widget.userDto.nickname}"),
            Text("tel : ${widget.userDto.tel}")
          ],
        ),
      ),
    );
  }
}
