import 'package:http/http.dart' as http;
import 'dart:convert';

class TomatoApi {
  static Future<Map<String, dynamic>> fetchData() async {
    final response =
    await http.get(Uri.parse('https://marcconrad.com/uob/tomato/api.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
