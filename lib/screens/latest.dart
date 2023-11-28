import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';

class latest extends StatefulWidget {
  const latest({super.key});

  @override
  State<latest> createState() => _latestState();
}

class _latestState extends State<latest> {
  ApiEverything client2 = ApiEverything();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Vector.png'),
                    
                  ]
                ),
              ),
              SizedBox(height: 20,),
              _content(),
              
              
  
      
        
            ],
          ),
        )),
    );
  }
  Widget _content() {
    return FutureBuilder(
      future: client2.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 150 * articles!.length.toDouble(),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () => Navigator.pushNamed(context, '/detail',
                            arguments: articles[index]),
                        child: Container(
                          child: Row(
                            children: [
                              Image.network(
                                articles[index].urlToImage ??
                                    "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                                width: 96,
                                height: 96,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${articles[index].publishedAt}',
                                      style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      child: Text(
                                        articles[index].title ?? "null",
                                        style: GoogleFonts.manrope(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            articles[index].author ?? "null",
                                            style: GoogleFonts.manrope(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.blueGrey,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                  itemCount: articles.length),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}