// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/NewsResponse.dart';

class HeadlineNewsController extends ChangeNotifier {
  List data = [];

  ///
  handleGetHeadlineNewsButton() async {
    data = await getHeadlineNews();

    notifyListeners();
  }

  ///
  getHeadlineNews() async {
    String country = "jp";
    String apiKey = "a7671b32f93f4086901844f9d805d0bc";

    Uri uri = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      final headlineNewsResponse = NewsResponseFromJson(response.body);
      return headlineNewsResponse.articles;
    } else {
      return [];
    }
  }
}
