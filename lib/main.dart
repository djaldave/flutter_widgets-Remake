import 'package:Flutter_Widgets/favorite_page.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';
import 'loginpage.dart';
import 'recipespage.dart';
import 'registrationpage.dart';
import 'models/favoritesmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(YummyRecipes());
}

class YummyRecipes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child: MaterialApp(title: "Yummy Recipes", initialRoute: '/', routes: {
        '/': (context) => HomePage(),
        '/recipes': (context) => RecipesPage(),
        '/login': (context) => LoginPage(),
        '/favorite-page': (context) => FavoritePage(),
        '/registration': (context) => RegistrationPage()
      }
          // home: HomePage(),
          ),
    );
  }
}
