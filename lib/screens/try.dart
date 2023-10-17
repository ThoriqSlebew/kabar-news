import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:flutter_application_1/services/api_services.dart';

class coba extends StatelessWidget {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('news'),
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) =>
                ListTile(
                  title: Text(articles?[index].title ?? "kosong"),
                ),
                );
            
          }
          
          return const Center(
            child: CircularProgressIndicator(),
          );
          
        },
      ),
    );
  }
}
