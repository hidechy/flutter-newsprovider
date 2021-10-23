// To parse this JSON data, do
//
//     final headlineNewsResponse = headlineNewsResponseFromJson(jsonString);

import 'dart:convert';

HeadlineNewsResponse headlineNewsResponseFromJson(String str) =>
    HeadlineNewsResponse.fromJson(json.decode(str));

String headlineNewsResponseToJson(HeadlineNewsResponse data) =>
    json.encode(data.toJson());

///
class HeadlineNewsResponse {
  HeadlineNewsResponse(
      {required this.status,
      required this.totalResults,
      required this.articles});

  String status;
  int totalResults;
  List<Article> articles;

  factory HeadlineNewsResponse.fromJson(Map<String, dynamic> json) =>
      HeadlineNewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

///
class Article {
  Article(
      {required this.source,
      this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      this.content});

  Source source;
  dynamic author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  dynamic content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
      };
}

///
class Source {
  Source({this.id, required this.name});

  dynamic id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
