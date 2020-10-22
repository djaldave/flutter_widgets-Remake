import 'package:flutter/material.dart';

class AccountMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
            Text("Settings"),
          ],
        ),
        Padding(padding: EdgeInsets.only(right: 20)),
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (Route<dynamic> route) => false);
                }),
            Text("Logout"),
          ],
        ),
      ],
    );
  }
}
