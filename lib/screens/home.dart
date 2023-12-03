import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:flutter_application_1/screens/latest.dart';
import 'package:flutter_application_1/screens/trending.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

 

var kategoriselected = 0;
var a = 10;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();
  ApiEverything client2 = ApiEverything();
  TextEditingController searchController = TextEditingController();
  List<Article> filteredData = [];

  

  @override
  Widget build(BuildContext context) {
    String? email = ModalRoute.of(context)?.settings.arguments as String?;

    if (email == null) {
      email = 'Guest';
    }
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                _header(email),
                const SizedBox(
                  height: 12,
                ),
                divider(),
                //_search(),
                _trending(),
                const SizedBox(
                  height: 12,
                ),
                _card(context),
                const SizedBox(
                  height: 16,
                ),
                _latest(),
                // const SizedBox(
                //   height: 16,
                // ),
                // _categories(),
                const SizedBox(height: 16),
                _content(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
        );
  }

  Padding divider() {
    return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),
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
              height: 160 * a.toDouble(),
              child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) { 

                    return InkWell(
                        onTap: () => Navigator.pushNamed(context, '/detail',
                            arguments: articles![index]),
                        child: Container(
                          child: Row(
                            children: [
                              Image.network(
                                articles![index].urlToImage ??
                                    "https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1",
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
                                        articles[index].publishedAt!,
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
                                        articles![index].title ?? "null",
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
                      );},
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 30,
                      ),
                  itemCount: 10),
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Padding _latest() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Latest',
            style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: const Color(0xff3f3e3f)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => latest()));
            },
            child: Text(
              'See all',
              style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Widget _card(BuildContext context) {
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
                      arguments: articles?[0]),
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
                        articles?[0].urlToImage ??
                            "https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1",
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

              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  articles?[0].title ?? "null",
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
                    SizedBox(
                      width: 200,
                      child: Text(
                        articles?[0].author ?? "null",
                        style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.blueGrey,
                        ),
                        overflow: TextOverflow.ellipsis,
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

  Padding _trending() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Trending',
            style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: const Color(0xff3f3e3f)),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => trending()));
            },
            child: Text(
              'See all',
              style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }

  Padding _search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(FeatherIcons.search),
          hintText: 'Search',
        ),
      ),
    );
  }

  Padding _header(String email) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/Vector.png'),
          Text("Welcome !",
              style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: const Color(0xff3f3e3f))),
        ],
      ),
    );
  }
}
