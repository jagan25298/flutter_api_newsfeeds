import 'dart:convert';
import 'package:api_newsfeed/api_class.dart';
import 'package:http/http.dart' as http;

class ApiServer {
  static Future<NewsFeed> fetchLessons() async {
    print('--------api url running');
    final response = await http.get(Uri.parse(
        'https://riad-news-api.vercel.app/api/news/source?code=US-FN'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      print('${response.body}');
      return NewsFeed.fromJson(jsonResponse);
    } else {
      throw Exception('failed to reload');
    }
  }
}
