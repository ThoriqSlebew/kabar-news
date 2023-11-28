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

  class ApiEverything {
  final endPointUrl ="https://newsapi.org/v2/everything?domains=techcrunch.com,thenextweb.com&apiKey=98f4b672146743b2b8b5f5a51a4130fc";


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

  class ApiBussines {
  final endPointUrl ="https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=98f4b672146743b2b8b5f5a51a4130fc";


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

  class ApiHealth {
  final endPointUrl ="https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=98f4b672146743b2b8b5f5a51a4130fc";


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

  class ApiTechnology {
  final endPointUrl ="https://newsapi.org/v2/top-headlines?country=us&category=technology&apiKey=98f4b672146743b2b8b5f5a51a4130fc";


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



  
