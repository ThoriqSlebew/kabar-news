import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/models/article_model.dart';


var kategori = [
  "All",
  "Sports",
  "Politics",
  "Bussines",
  "Health",
  "Travel",
  "Science"
];
BottomNavigationBarItem _buildBottomNavigationBarItem(
    IconData iconData, String labelText) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.symmetric(horizontal : 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData),
           SizedBox(width: 2,),// Jarak antara ikon dan teks
          Expanded(
            child: Text(
              labelText,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    ),
    label: '',
  );
}
BottomNavigationBarItem _buildEndBottomNavigationBarItem(IconData iconData, String labelText) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(iconData),
          const SizedBox(width: 8), // Jarak antara ikon dan teks
          Text(
            labelText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    label: '',
  );
}







var kategoriselected = 0;



class news_detail extends StatelessWidget {
  const news_detail({super.key});
  @override
  Widget build(BuildContext context) {
    final articles = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                _header(context),
                const SizedBox(
                  height: 12,
                ),
                _card(articles),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    articles.content ?? "null",
                    style: GoogleFonts.manrope(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                  ),
                ),
                SizedBox(
                  height: 160,
                ),
                Text("Made with ❤️ by Thoriq Khoir",
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                  )),
              ],
            ),
          ),
        ),
        
        );
  }


  Column _card(Article articles) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              // Image.network(
              //               content.urlToImage ?? "judul Tidak Ada",
              //               width: 96,
              //               height: 96,
              //               fit: BoxFit.cover,
              //             ),
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        articles.publishedAt ?? "tidak diketahui",
                        style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      
                    ],
                  ),
                ],
              ),
              const Spacer(),
              
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        AspectRatio(
          aspectRatio: 364 / 183,
          child: Container(
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xff3f3e3f),
            ),
            child: Stack(
              children: [
                Image.network(articles.urlToImage ?? "https://www.wfla.com/wp-content/uploads/sites/71/2023/05/GettyImages-1389862392.jpg?w=2560&h=1440&crop=1",
                  height: double.maxFinite,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                )
              ],
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
            articles.author ?? "null",
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            '${articles.title}',
            style: GoogleFonts.manrope(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        
      ],
    );
  }

  Padding _header(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {Navigator.of(context).pop();}, icon: const Icon(FeatherIcons.arrowLeft)),
          Spacer(),
          IconButton(onPressed: ()  {
          }, icon: const Icon(FeatherIcons.share2)),
          // IconButton(
          //     onPressed: () {}, icon: const Icon(FeatherIcons.moreVertical)),
        ],
      ),
    );
  }
}
