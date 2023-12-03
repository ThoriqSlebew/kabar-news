import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/services/firestore_services.dart';
import 'package:google_fonts/google_fonts.dart';

class profile_detail extends StatefulWidget {
  const profile_detail({Key? key}) : super(key: key);

  @override
  _ProfileDetailState createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<profile_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Database.getData(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Text('Edit Your Profile',
                          style: GoogleFonts.manrope(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          )),
                    ),
                    SizedBox(height: 80),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          
                          child: Card(
                            elevation: 6,
                            child: Container(
                              width: 300,
                              height: 460,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  const SizedBox(height: 20),
                                  const CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage(
                                        'assets/images/saya.jpg'), // Replace with your image path
                                  ),
                                  const SizedBox(height: 20),
                                  Text("email :",
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue,
                                      )),
                                  Text(documentSnapshot['email'],
                                  style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      SizedBox(height: 5),
                                      Divider(),
                                  Text("username :",
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue,
                                      )),
                                  Text(documentSnapshot['username'],
                                  style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      SizedBox(height: 5),
                                      Divider(),
                                  Text("no_telp :",
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue,
                                      )),
                                  Text(documentSnapshot['no_telp'],
                                  style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      SizedBox(height: 5),
                                      Divider(),
                                  Text("alamat :",
                                      style: GoogleFonts.manrope(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue,
                                      )),
                                  Text(documentSnapshot['alamat'],
                                  style: GoogleFonts.manrope(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      SizedBox(height: 5),
                                      Divider(),
                                  SizedBox(
                                    width: 300,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Database.update(documentSnapshot, context);
                                            },
                                            icon: Icon(Icons.edit,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 120),
                    Center(
                      child: Text("Made with ❤️ by Thoriq Khoir",
                                      style: GoogleFonts.manrope(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: Colors.black,
                                      )),
                    ),
                  ],
                ); // Continue building your list with documentSnapshot
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
