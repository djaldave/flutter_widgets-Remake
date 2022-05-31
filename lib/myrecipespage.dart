import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:provider/provider.dart';

import 'edit_recipe.dart';
import 'json_models/recipe.dart';
import 'models/auth_model.dart';
import 'recipeitem.dart';
import 'services/recipeservice.dart';

class MyRecipesPage extends StatefulWidget {
  _MyRecipesPageState createState() => _MyRecipesPageState();
}

class _MyRecipesPageState extends State<MyRecipesPage> {
  GlobalKey<PaginationViewState> _key;
  int _page;
  PaginationViewType _paginationViewType;
  String _user;
  @override
  initState() {
    _user = Provider.of<AuthModel>(context, listen: false).user;
    _page = 0;
    _paginationViewType = PaginationViewType.listView;
    _key = GlobalKey<PaginationViewState>();

    super.initState();
  }

  Future<List<RecipeInfo>> pageFetch(int offset) async {
    _page++;
    var res = await getRecipes(_user, _page);
    return res;
  }

  Future<List<RecipeInfo>> pageRefresh(int offset) async {
    _page = 0;
    return pageFetch(offset);
  }

  _removeRecipe(recipeData) async {
    var token = Provider.of<AuthModel>(context, listen: false).token;
    var res = await deleteRecipe(recipeData.id, token);
    _key.currentState.refresh();
    return res;
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result =
        await Navigator.pushNamed(context, '/add-recipe').then((value) {
      _page = 0;
    });

    // After the Selection Screen returns a result, hide any previous snackbars
    // and show the new result.
    print('$result');
    if (result == null) {
      setState(() {
        _key.currentState.refresh();
      });
    }
    if (result != null) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text("$result")));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Recipes'),
          backgroundColor: Color.fromRGBO(56, 142, 60, 1),
        ),
        body: PaginationView<RecipeInfo>(
            onError: null,
            key: _key,
            paginationViewType: _paginationViewType,
            itemBuilder: (context, recipeInfo, index) => RecipeItem(
                recipeItem: recipeInfo,
                deleteAction: _removeRecipe,
                editAction: () async {
                  var res = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EditRecipe(recipeInfo: recipeInfo),
                      ));
                  print(res);
                  if (res != null) {
                    _key.currentState.refresh();
                    // setState(() {});
                    ScaffoldMessenger.of(context)
                      ..removeCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text('$res')));
                  }
                }), //RecipeItem
            pageFetch: pageFetch,
            // pageRefresh: pageRefresh,
            pullToRefresh: false,
            initialLoader: Center(child: CircularProgressIndicator()),
            bottomLoader: Center(
              child: Text('Loading data...'),
            ),
            onEmpty: Center(
              child: Text('No recipe available.Press button to add!'),
            )),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
              onPressed: () {
                _navigateAndDisplaySelection(context);
              },
              backgroundColor: Color.fromRGBO(56, 142, 60, 1),
              child: Icon(Icons.add));
        })); //Scaffold
  }
}
