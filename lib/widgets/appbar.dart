import "dart:io";

import 'package:flutter/material.dart';

import "package:flutter/cupertino.dart";

class AppbarTop extends StatelessWidget implements PreferredSizeWidget {
  final Function toggleBtn;
  const AppbarTop({super.key, required this.toggleBtn});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text("Personal Expenses"),
            trailing: Row(
              children: <Widget>[
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => toggleBtn,
                )
              ],
            ),
          )
        : AppBar(
            title: const Text(
              "My Expense",
              style: TextStyle(fontFamily: "Quicksand"),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () => toggleBtn(context),
                  icon: const Icon(Icons.add))
            ],
          );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
