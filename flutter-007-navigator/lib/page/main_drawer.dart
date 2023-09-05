import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';

Widget mainDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("callor"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.png"),
              )
            ],
            accountName: Text("Callor"),
            accountEmail: Text("callor@callor.com"),
          ),
          ListTile(
              title: const Text("Home",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  )),
              leading: const Icon(Icons.home, color: Colors.blue),
              onTap: () {
                debugPrint("Home 메뉴가 클릭됨");

                /// 스마트 기기에서 현재 화면을 다른 화면으로 전환하기
                /// web, pc 어플리케이션에서는  단순히 화면을 전환하는데
                /// 별 어려움이 없이 수행이 가능하다.
                /// 스마트 기기에서는 화면 하나 하나가 context 이다
                /// 화면을 전환 시킬때도 context 라는
                /// 친구를 잘 관리해야 한다
                // const HomePage();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              }),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text("MyPage",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            onTap: () => Navigator.of(context).pushNamed("/mypage"),
            leading: const Icon(Icons.supervised_user_circle_outlined,
                color: Colors.blue),
          ),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
            onTap: () => Navigator.of(context).pushNamed(
              "/email",
              arguments: {
                "email": "callor@callor.com",
                "password": "12345",
              },
            ),
            title: const Text("email",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            leading: const Icon(Icons.email_outlined, color: Colors.blue),
          ),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
        ],
      ),
    );
