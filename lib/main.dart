import 'package:flutter/material.dart';

import 'registrationpage.dart';

void main() {
  runApp(YummyRecipes());
}

class YummyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Yummy Recipes",
      home: RegistrationPage(),
      // home: HomePage(),
    );
  }
}
