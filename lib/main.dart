  import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loginpage.dart';
import 'recipespage.dart';
import 'registrationpage.dart';

void main() {
  runApp(YummyRecipes());
}

class YummyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Yummy Recipes", initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      '/recipes': (context) => RecipesPage(),
      '/login': (context) => LoginPage(),
      '/registration': (context) => RegistrationPage()
    }
        // home: HomePage(),
        );
  }
}
