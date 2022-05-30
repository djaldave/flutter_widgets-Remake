import 'package:flutter/material.dart';
import 'json_models/categories.dart';
import 'models/auth_model.dart';
import 'services/categoriesservice.dart';
import 'services/recipeservice.dart';
import 'package:provider/provider.dart';

class AddRecipe extends StatefulWidget {
  _AddRecipeState createState() => _AddRecipeState();
}

class _AddRecipeState extends State<AddRecipe> {
  final _formKey = GlobalKey<FormState>();
  Future<Categories> _catFuture;
  var _selectedCat;
  final _recipeCtrl = TextEditingController();
  final _descCtrl = TextEditingController();
  @override
  initState() {
    super.initState();
    _catFuture = getCategories();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _recipeCtrl.dispose();
    _descCtrl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add New Recipe'),
          backgroundColor: Color.fromRGBO(56, 142, 60, 1),
        ),
        body: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                  controller: _recipeCtrl,
                  decoration: InputDecoration(hintText: 'Recipe Name')),
              SizedBox(height: 10),
              TextFormField(
                  //Multiline
                  controller: _descCtrl,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(hintText: 'Description')),
              SizedBox(height: 20),
              Text('Category: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              FutureBuilder<Categories>(
                  future: _catFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Cannot load categories');
                    } else if (snapshot.hasData) {
                      var categories = snapshot.data.categories;
                      return DropdownButton<Map>(
                          isExpanded: true,
                          elevation: 16,
                          hint: Text('Choose a Category:'),
                          value: _selectedCat,
                          items: categories.map((data) {
                            return DropdownMenuItem<Map>(
                                value: data, child: Text(data['name']));
                          }).toList(),
                          onChanged: (val) {
                            print('$val');
                            setState(() {
                              _selectedCat = val;
                            });
                          });
                    }
                    return Text('Loading categories...');
                  })
            ])),
        floatingActionButton: FloatingActionButton.extended(
            icon: Icon(Icons.save),
            label: Text('Save'),
            backgroundColor: Color.fromRGBO(56, 142, 60, 1),
            onPressed: () async {
              Map data = {
                'name': _recipeCtrl.text,
                'description': _descCtrl.text,
                'cat_id': _selectedCat['id'].toString()
              };
              var token = Provider.of<AuthModel>(context, listen: false).token;

              var recipeRes = await addRecipe(data, token);

              Navigator.pop(context, recipeRes.message);
            }));
  }
}
