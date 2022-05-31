import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/auth_model.dart';

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
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.clear();
                  Provider.of<AuthModel>(context, listen: false).logout();
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
