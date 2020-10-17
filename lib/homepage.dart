import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yummy Recipes"),
      ),
      body: Center(
        child: Text("Yummy Recipes App"),
      ),
    );
  }
}
