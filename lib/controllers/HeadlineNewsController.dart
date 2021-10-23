import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/HeadlineNewsResponse.dart';

class HeadlineNewsController extends ChangeNotifier {
  List data = [];

  ///
  handleGetHeadlineNewsButton() async {
    data = await getHeadlineNews();

    notifyListeners();
  }

  ///
  getHeadlineNews() async {
    Uri uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=jp&apiKey=a7671b32f93f4086901844f9d805d0bc');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final headlineNewsResponse = headlineNewsResponseFromJson(response.body);
      return headlineNewsResponse.articles;
    } else {
      return [];
    }
  }
}
