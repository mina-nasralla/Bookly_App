import 'package:booklyapp/Features/splach/presentation/views/splash_screen.dart';
import 'package:booklyapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookly App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Kprimarycolor,
        textTheme: GoogleFonts.montserratTextTheme(
          ThemeData.dark().textTheme,
        )
      ),
      home: const SplashScreen(),
    );
  }

}