import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_mode.dart';

class ApiManager {
  //get api data
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;

    // use try because not every reult can be get
    try {
      var response = await client
          .get(Uri.parse('https://newsapi.org/v2/top-headlines?country=in&apiKey=11cd66d3a6994c108e7fb7d92cee5e12'));
      // check if data was success
      if (response.statusCode == 200) {
        print('saboor=${response.body}');
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return newsModel;
    }

    return newsModel;
  }
}