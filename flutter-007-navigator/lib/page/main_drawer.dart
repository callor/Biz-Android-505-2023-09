import 'dart:convert';

import 'package:flutter/material.dart';

Widget mainDrawer() => Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
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
            title: Text("Home",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            leading: Icon(Icons.home, color: Colors.blue),
          ),
          Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
            title: Text("MyPage",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            leading:
                Icon(Icons.supervised_user_circle_outlined, color: Colors.blue),
          ),
          Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
            title: Text("email",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            leading: Icon(Icons.email_outlined, color: Colors.blue),
          ),
          Divider(
            height: 0.5,
            color: Colors.blue,
          ),
        ],
      ),
    );
