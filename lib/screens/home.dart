import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/article_model.dart';
import 'package:flutter_application_1/models/content.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';

var kategori = [
  "All",
  "Sports",
  "Politics",
  "Bussines",
  "Health",
  "Travel",
  "Science"
];

var kategoriselected = 0;


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                _header(),
                const SizedBox(
                  height: 12,
                ),
                _search(),
                const SizedBox(
                  height: 12,
                ),
                _trending(),
                const SizedBox(
                  height: 12,
                ),
                _card(context),
                const SizedBox(
                  height: 16,
                ),
                _latest(),
                const SizedBox(
                  height: 16,
                ),
                _categories(),
                const SizedBox(height: 16),
                _content(),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue.shade800,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType
              .fixed, // Mengatur tata letak label berada di samping ikon
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Icon(
                  FeatherIcons.home,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Icon(FeatherIcons.messageSquare),
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Icon(FeatherIcons.bookmark),
              ),
              label: 'Bookmark',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(bottom: 6.0),
                child: Icon(FeatherIcons.user),
              ),
              label: 'Settings',
            ),
          ],
        ));
  }

  Widget _content() {
    return FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 150 * content.length.toDouble(),
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => InkWell(
                onTap: () => Navigator.pushNamed(context, '/detail',arguments: 
                content[index]),
                child: Container(
                      child: Row(
                        children: [
                          Image.network(
                            articles?[index].urlToImage ?? "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
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
                                  '${content[index].name}',
                                  style: GoogleFonts.manrope(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  '${content[index].title}',
                                  style: GoogleFonts.manrope(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      child: Image.asset(
                                          'assets/images/News Author.png'),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'BBC News',
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(
                                      FeatherIcons.clock,
                                      color: Colors.blueGrey,
                                      size: 14,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      '${content[index].time} hours ago',
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blueGrey,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text('...',
                                        style: GoogleFonts.manrope(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blueGrey,
                                        ))
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
              itemCount: 5),
        ),
      );
            
    }
          
          return const Center(
            child: CircularProgressIndicator(),
          );
          
        },
      
    );
  }

  Padding _categories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 25,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: kategoriselected == index
                          ? Colors.blue.shade600
                          : Colors.grey.shade100),
                  child: Text(
                    kategori[index],
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kategoriselected == index
                          ? Colors.white
                          : Colors.grey.shade900.withOpacity(.3),
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
            itemCount: kategori.length),
      ),
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
          Text(
            'See all',
            style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: const Color(0xff3f3e3f)),
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
              onTap: () => Navigator.pushNamed(context, '/detail',arguments: 
                content[0]),
              child: Container(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: const Color(0xff3f3e3f),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      articles?[0].urlToImage ?? "https://www.recia.fr/wp-content/uploads/2019/09/no_image.png",
                            width: 269,
                            height: 269,
                            fit: BoxFit.cover,
                    ),
                  ],
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
                Text(
                  articles?[0].author ?? "null",
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  FeatherIcons.clock,
                  color: Colors.blueGrey,
                  size: 14,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  articles?[0].publishedAt ?? "waktu",
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueGrey,
                  ),
                ),
                const Spacer(),
                Text('...',
                    style: GoogleFonts.manrope(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                    ))
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
          Text(
            'See all',
            style: GoogleFonts.manrope(
                fontSize: 20,
                fontWeight: FontWeight.w200,
                color: const Color(0xff3f3e3f)),
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
          suffixIcon: Icon(FeatherIcons.sliders),
        ),
      ),
    );
  }

  Padding _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/Vector.png'),
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.bell))
        ],
      ),
    );
  }
}
