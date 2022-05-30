import 'package:flutter/material.dart';

class RecipeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.pushNamed(context, '/favorite-page');
              },
              color: Colors.red,
            ),
            Text("Favorites"),
          ],
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.create),
                onPressed: () {
                  Navigator.pushNamed(context, '/my-recipe');
                },
                color: Colors.green),
            Text("My Recipes"),
          ],
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        Column(
          children: [
            IconButton(
                icon: Icon(Icons.image_search),
                onPressed: () {
                  Navigator.pushNamed(context, '/recipes');
                },
                color: Colors.orange),
            Text("My Recipes"),
          ],
        ),
      ],
    );
  }
}
