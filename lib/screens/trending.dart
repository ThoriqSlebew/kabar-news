import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';

class trending extends StatefulWidget {
  const trending({super.key});

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              SizedBox(
                height:  1000,
                child: ListView.separated(
                  itemBuilder: (context, index) => _card(context, index), 
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 8,),
                        Divider(),
                        SizedBox(height: 8,)
                      ],
                    );
                  }, 
                  itemCount: 6),
              )
            ],
          ),
        )),
    );
  }
  Widget _card(BuildContext context, int index) {
    return FutureBuilder(
      future: client.getArticle(),
      builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
        if (snapshot.hasData) {
          List<Article>? articles = snapshot.data;
          return Column(
            children: [
              AspectRatio(
                aspectRatio: 364 / 183,
                child: InkWell(
                  onTap: () => Navigator.pushNamed(context, '/detail',
                      arguments: articles?[index]),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: const Color(0xff3f3e3f),
                    ),
                    child: Container(
                      clipBehavior: Clip.none,
                      child: Image.network(
                        articles?[index].urlToImage ??
                            "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                         width: 269,
                         height: 269,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "United State",
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Text(
                  articles?[index].title ?? "null",
                  style: GoogleFonts.manrope(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      articles?[index].author ?? "null",
                      style: GoogleFonts.manrope(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.blueGrey,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              )
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}