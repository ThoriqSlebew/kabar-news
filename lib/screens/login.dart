import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Register.dart';
import 'package:flutter_application_1/screens/navigation.dart';
import 'package:flutter_application_1/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:feather_icons/feather_icons.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user = await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
      context: context,
    );

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successfully'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello',
                        style: GoogleFonts.manrope(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Again!',
                        style: GoogleFonts.manrope(
                          fontSize: 60,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue,
                        ),
                      ),
                      Text('Welcome back you’ve \nbeen missed',
                          style: GoogleFonts.manrope(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          )),
                      SizedBox(
                        height: 50,
                      ),
                      Text('Email',
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Password',
                          style: GoogleFonts.manrope(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          )),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Password',
                          suffixIcon: Icon(FeatherIcons.eyeOff),
                        ),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text('Forgot the password?',
                              style: GoogleFonts.manrope(color: Colors.blue))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.maxFinite,
                        child: ElevatedButton(
                            onPressed: () {
                              _login();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue, // Warna latar belakang
                              onPrimary: Colors.white, // Warna teks
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(6.0), // Border radius
                              ),
                            ),
                            child: Text('Login',
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(child: const Text("Don’t have an account?")),
                          const SizedBox(width: 4.0),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              child: Center(
                                child: const Text(
                                  "Register.",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )),
                    ])),
          ),
        ],
      ),
    ));
  }
}
