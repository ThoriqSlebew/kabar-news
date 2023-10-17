import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/content.dart';
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
    final content = ModalRoute.of(context)!.settings.arguments as ContentModel;
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
                _card(content),
                const SizedBox(
                  height: 16,
                ),
                _content(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            _buildBottomNavigationBarItem(FeatherIcons.heart, '24.5K'),
            _buildBottomNavigationBarItem(FeatherIcons.messageSquare, '1K'),
            _buildEndBottomNavigationBarItem(FeatherIcons.bookmark, ''),
          ],
        ));
  }

  Padding _content() {
    String longText = """
    Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of "earning their money in other people's blood".

    In an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn this year.

    There has been a growing frustration among Ukraine's leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.
  """;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height:1000,
        child: ListView.separated(
          physics:
              const NeverScrollableScrollPhysics(), // Mengubah menjadi AlwaysScrollableScrollPhysics agar dapat di-scroll
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(height: 30),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Text(
              longText, // Menampilkan teks panjang
              textAlign: TextAlign.justify,
              style: GoogleFonts.manrope(
                fontSize: 18,
                color: Colors.black,
              ),
            );
          },
        ),
      ),
    );
  }

  Column _card(ContentModel content) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset('assets/images/Ellipse.png'),
              const SizedBox(
                width: 5,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'BBC News',
                        style: GoogleFonts.manrope(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            FeatherIcons.clock,
                            color: Colors.blueGrey,
                            size: 14,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${content.time} hours ago',
                            style: GoogleFonts.manrope(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Following',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18, // Atur ukuran huruf sesuai keinginan Anda
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                  // Atur panjang dan lebar sesuai keinginan Anda
                ),
              )
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
                Image.asset(
                  'assets/images/${content.image}',
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
            '${content.name}',
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
            '${content.title}',
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
          IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.share2)),
          IconButton(
              onPressed: () {}, icon: const Icon(FeatherIcons.moreVertical)),
        ],
      ),
    );
  }
}
