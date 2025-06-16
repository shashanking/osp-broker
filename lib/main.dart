import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'router/app_router.dart';
import 'core/infrastructure/hive_init.dart';
import 'core/infrastructure/providers.dart' show AuthBoxNotifier, authBoxProvider, cookieManagerProvider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive and get auth box
  final authBox = await openAuthBox();
  
  // Create ProviderContainer for initialization
  final container = ProviderContainer();

  // Initialize the auth box notifier with the opened auth box
  // final authBoxNotifier = AuthBoxNotifier(authBox);
  
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: ScreenUtilInit(
        designSize: const Size(1920, 1080),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => ProviderScope(
          overrides: [
          authBoxProvider.overrideWithValue(authBox),
          ],
          child: const MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp.router(
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
        routerConfig: appRouter,
      ),
    );
  }
}
