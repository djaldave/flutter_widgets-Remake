import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../json_models/categories.dart';
import 'config.dart';

Future<Categories> getCategories() async {
  var res = await http.get(Uri.parse('$API_URL/categories'));

  if (res.statusCode == 200) {
    return Categories.fromJson(jsonDecode(res.body));
  } else {
    throw Exception('An error occured');
  }
}