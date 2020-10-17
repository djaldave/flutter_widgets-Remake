import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            Text("Settings"),
          ],
        ),
        Column(
          children: [
            IconButton(icon: Icon(Icons.close), onPressed: () {}),
            Text("Logout"),
          ],
        ),
      ],
    );
  }
}
