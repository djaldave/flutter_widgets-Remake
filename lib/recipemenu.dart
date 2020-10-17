import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            IconButton(icon: Icon(Icons.favorite), onPressed: () {}),
            Text("Favorites"),
          ],
        ),
        Column(
          children: [
            IconButton(icon: Icon(Icons.create), onPressed: () {}),
            Text("My Recipes"),
          ],
        ),
        Column(
          children: [
            IconButton(icon: Icon(Icons.image_search), onPressed: () {}),
            Text("My Recipes"),
          ],
        ),
      ],
    );
  }
}
