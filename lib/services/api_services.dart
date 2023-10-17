import 'dart:convert';

import 'package:flutter_application_1/models/article_model.dart';
import 'package:http/http.dart';

class ApiService{

  final endPointUrl ="https://newsapi.org/v2/top-headlines?country=us&category=business&pageSize=10&apiKey=98f4b672146743b2b8b5f5a51a4130fc";


  Future<List<Article>> getArticle() async{
    Response res = await get (Uri.parse(endPointUrl));

    if (res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles= 
          body.map((dynamic item) => Article.fromJson(item)).toList();
          return articles;
      }else{
        throw("Mboten saget");
      }
    }
  }
