import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        // color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/News Images.png'),
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text('Lorem Ipsum is simply \ndummy',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                  )),
            ),
            SizedBox(height: 9),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry.',
                style: GoogleFonts.manrope(
                  fontSize: 17,
                ),
              ),
            ),
            SizedBox(
              height: 78,
            ),
            Row(
              children: [
                Container(
                  width: 80,
                  padding: EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FeatherIcons.circle,
                        size: 14,
                      ),
                      Icon(
                        FeatherIcons.circle,
                        size: 14,
                      ),
                      Icon(FeatherIcons.circle, size: 14),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/Home');} ,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Warna latar belakang
                      onPrimary: Colors.white, // Warna teks
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(6.0), // Border radius
                      ),
                    ),
                    child: Text('hayuk'),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
