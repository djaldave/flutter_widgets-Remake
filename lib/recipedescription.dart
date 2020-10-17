import 'package:flutter/material.dart';

class RecipeDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Fried Chicken"),
          Text("by Cookmaster"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Cooking Time: "),
              Text("20 min"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Category: "),
              Text("Main Dish"),
            ],
          ),
        ],
      ),
    );
  }
}
