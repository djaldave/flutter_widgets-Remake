import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../json_models/recipe.dart';
import 'config.dart';
import 'dart:io'; //HttpHeaders

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
