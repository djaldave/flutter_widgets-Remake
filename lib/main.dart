import 'package:flutter/material.dart';

void main() {
  runApp(YummyRecipes());
}

class YummyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yummy Recipes",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Yummy Recipes"),
        ),
        body: Center(
          child: Text("Yummy Recipes App"),
        ),
      ),
    );
  }
}
