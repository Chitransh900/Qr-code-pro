import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/home_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6C63FF),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xFFFF6584)),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.nunito().fontFamily,
        textTheme: GoogleFonts.nunitoTextTheme(),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}


