import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text("About Us",
              style: GoogleFonts.manrope(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.blue,
                            ),),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Selamat datang di Kabar News, pintu gerbang Anda ke dunia berita yang dinamis dan terkini. Kami adalah aplikasi mobile yang didedikasikan untuk menyajikan informasi terbaru secara cepat, akurat, dan terpercaya kepada para pembaca kami. Kabar News hadir dengan visi untuk menyediakan akses yang mudah dan cepat kepada berbagai topik berita, mulai dari berita terkini seputar politik, bisnis, teknologi, hiburan, olahraga, kesehatan, hingga berita lokal di berbagai belahan dunia. Apa yang membedakan Kabar News adalah komitmen kami untuk menyajikan konten yang disusun secara cermat oleh tim jurnalis terbaik kami, yang selalu berupaya memberikan liputan yang mendalam dan berimbang tentang peristiwa terbaru di seluruh dunia. Kami memahami pentingnya informasi yang dapat dipercaya, oleh karena itu, setiap berita yang kami tampilkan melalui aplikasi kami telah melalui proses verifikasi dan penelitian yang ketat untuk memastikan keakuratannya. Dengan antarmuka yang ramah pengguna, Kabar News memudahkan Anda untuk menemukan dan menjelajahi berbagai cerita menarik dengan cepat dan nyaman. Di Kabar News, kami juga menghargai masukan dari para pembaca kami. Kami senantiasa terbuka untuk umpan balik, saran, dan permintaan dari Anda agar dapat terus meningkatkan pengalaman membaca berita Anda. Terima kasih telah memilih Kabar News sebagai sumber informasi Anda. Bergabunglah dengan kami untuk tetap terhubung dengan dunia, satu kabar demi satu kabar.",
              style: GoogleFonts.manrope(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black,
                                        ),textAlign: TextAlign.justify,
                                        ),
            )
          ],
        )
      ),
    );
  }
}