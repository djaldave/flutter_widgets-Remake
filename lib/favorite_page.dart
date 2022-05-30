import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/favoritesmodel.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Color.fromRGBO(56, 142, 60, 1),
      ),
      body: Consumer<FavoritesModel>(
        builder: (context, favorite, child) => ListView.builder(
          itemBuilder: (context, index) => ListTile(
            title: Text(favorite.favorites[index]),
          ),
          itemCount: favorite.favorites.length,
        ),
      ),
    );
  }
}
