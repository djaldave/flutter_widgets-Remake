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
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Recipe of the day"),
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
