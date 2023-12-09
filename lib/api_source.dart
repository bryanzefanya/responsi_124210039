import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<Map<String, dynamic>> getCategories() async { //categories
    final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    final Uri uri = Uri.parse(baseUrl);

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch forecast data');
    }
  }

  static Future<Map<String, dynamic>> getMeal(String idMeal) async { //meals
    final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood';
    final Uri uri = Uri.parse('$baseUrl?id=$idMeal');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch forecast data');
    }
  }

  static Future<Map<String, dynamic>> getDetail(String idHero) async { //detail meals
    final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772';
    final Uri uri = Uri.parse('$baseUrl?id=$idHero');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch forecast data');
    }
  }

}
