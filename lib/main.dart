import 'package:flutter/material.dart';
import 'package:gen_ai_clone/pages/home_page.dart';
import 'package:gen_ai_clone/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme.copyWith(
            bodyMedium: TextStyle(fontSize: 16, color: AppColors.whiteColor),
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
