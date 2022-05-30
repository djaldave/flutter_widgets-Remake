import 'dart:async';
import 'dart:convert';
import 'dart:io'; //HttpHeaders

import 'package:http/http.dart' as http;

import '../json_models/recipe.dart';
import 'config.dart';

Future<Recipe> addRecipe(var data, var token) async {
  var res = await http.post(Uri.parse('$API_URL/recipes'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}, body: data);

  print(res.statusCode);
  if (res.statusCode == 200) {
    return Recipe.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('Error adding recipe');
  }
}

Future<List<RecipeInfo>> getRecipes(String user, int page) async {
  var res =
      await http.get(Uri.parse('$API_URL/users/$user/recipes?page=$page'));
  if (res.statusCode == 200) {
    var decoded = jsonDecode(res.body);
    return List<RecipeInfo>.from(
        decoded['data'].map((e) => RecipeInfo.fromJson(e)));
  } else {
    throw Exception('Error fetching recipes');
  }
}

Future<Recipe> deleteRecipe(id, token) async {
  var res = await http.delete(Uri.parse('$API_URL/recipes/$id'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

  if (res.statusCode == 200) {
    var decoded = jsonDecode(res.body);
    return Recipe.fromJson(decoded);
  } else {
    throw Exception('Error deleting recipe');
  }
}

Future<Recipe> updateRecipe(id, data, token) async {
  var res = await http.put(Uri.parse('$API_URL/recipes/$id'),
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'}, body: data);

  if (res.statusCode == 200) {
    var decoded = jsonDecode(res.body);
    return Recipe.fromJson(decoded);
  } else {
    throw Exception('Error updating recipe');
  }
}
