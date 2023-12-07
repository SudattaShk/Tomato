import 'package:http/http.dart' as http;
import 'dart:convert';

/// A class to interact with the Tomato API and fetch tomato-related data.
class TomatoApi {
  /// Fetches data from the Tomato API.
  ///
  /// Returns a [Map] containing the fetched data, or throws an [Exception] if
  /// the request fails.
  ///
  /// The API endpoint used for fetching data is 'https://marcconrad.com/uob/tomato/api.php'.
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
