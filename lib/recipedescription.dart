import 'package:flutter/material.dart';

class RecipeDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Fried Chicken",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text("by Cookmaster"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Cooking Time: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("20 min"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Category: ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Main Dish"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  Icons.star,
                  color: Colors.yellow[800],
                ),
            ],
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("View"),
          ),
        ],
      ),
    );
  }
}
