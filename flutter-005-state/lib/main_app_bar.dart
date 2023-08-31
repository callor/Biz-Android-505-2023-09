import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context) => AppBar(
      title: const Text("안녕하세요"),
      // backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,

      actions: [
        IconButton(
          onPressed: () {
            const snackBar = SnackBar(content: Text("안녕하세요"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
