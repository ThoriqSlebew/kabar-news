import 'package:flutter_application_1/models/source_model.dart';

class ContentModel {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  ContentModel({
      required this.source,
      required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content,
      });


factory ContentModel.fromJson(Map<String, dynamic> json){
  return ContentModel(
    source: Source.fromJson(json['source']), 
    author: json ['author'], 
    title: json['title'], 
    description: json['description'],
    url: json['url'],
    urlToImage: json['urlToImage'], 
    publishedAt: json['publishedAt'],
    content: json['content'],
    );
  }
} 