import 'package:Flutter_Widgets/recipemenu.dart';
import 'package:flutter/material.dart';

import 'accountmenu.dart';
import 'recipedescription.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yummy Recipes"),
        backgroundColor: Color.fromRGBO(56, 142, 60, 1),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Text(
                "Recipe of the day",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              color: Color.fromRGBO(255, 87, 34, 1),
            ),
            Image.asset('assets/images/friedchicken.jpg'),
            RecipeDescription(),
            Text("Recipes"),
            RecipeMenu(),
            Text("Account"),
            AccountMenu(),
          ],
        ),
      ),
    );
  }
}
