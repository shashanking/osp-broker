import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/home/presentation/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OSP Brokers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: const Color(0xFF24439B),
          onPrimary: const Color(0xFFEBE6DC),
          secondary: const Color(0xFF0A72B3),
          onSecondary: const Color(0xFFEBE6DC),
          surface: const Color(0xFFEBE6DC),
          onSurface: const Color(0xFF121212),
          error: Colors.red,
          onError: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFEBE6DC),
        textTheme: GoogleFonts.montserratTextTheme(),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF24439B)),
          titleTextStyle: TextStyle(
            fontFamily: 'Basement Grotesque',
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: Color(0xFF24439B),
          ),
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF24439B),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: const HomePage(),
    );
  }
}
