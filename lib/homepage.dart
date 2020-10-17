import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yummy Recipes"),
      ),
      body: Container(
        child: Column(
          children: [
            Text("Recipe of the day"),
            Image.asset('assets/images/friedchicken.jpg'),
          ],
        ),
      ),
    );
  }
}
