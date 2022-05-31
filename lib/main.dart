import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'addrecipe.dart';
import 'favorite_page.dart';
import 'homepage.dart';
import 'loginpage.dart';
import 'models/auth_model.dart';
import 'myrecipespage.dart';
import 'recipespage.dart';
import 'registrationpage.dart';

void main() {
  runApp(YummyRecipes());
}

class YummyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(AuthModel().isAuthenticated);
    return ChangeNotifierProvider(
      create: (context) => AuthModel(),
      child: MaterialApp(
          title: "Yummy Recipes",
          initialRoute:
              AuthModel().isAuthenticated == true ? '/homepage' : "/login",
          routes: {
            '/homepage': (context) => HomePage(),
            '/recipes': (context) => RecipesPage(),
            '/login': (context) => LoginPage(),
            '/favorite-page': (context) => FavoritePage(),
            '/registration': (context) => RegistrationPage(),
            '/my-recipe': (context) => MyRecipesPage(),
            '/add-recipe': (context) => AddRecipe()
          }
          // home: HomePage(),
          ),
    );
  }
}
