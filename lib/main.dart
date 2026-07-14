import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sasae_portal/screens/home_screen.dart';
import 'package:sasae_portal/screens/privacy_policy_screen.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/privacy',
      builder: (context, state) => const PrivacyPolicyScreen(),
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF1D4ED8),
        brightness: Brightness.light,
        surface: const Color(0xFFF8FAFC),
      ),
    );

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Sasae Works',
      theme: base.copyWith(
        scaffoldBackgroundColor: base.colorScheme.surface,
        appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0.5,
          centerTitle: false,
          backgroundColor: base.colorScheme.surface,
          foregroundColor: base.colorScheme.onSurface,
          surfaceTintColor: base.colorScheme.surfaceTint,
          titleTextStyle: TextStyle(
            fontFamily: base.textTheme.titleLarge?.fontFamily,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.2,
            color: base.colorScheme.onSurface,
          ),
        ),
        cardTheme: CardThemeData(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textTheme: GoogleFonts.zenKakuGothicNewTextTheme(base.textTheme).apply(
          bodyColor: base.colorScheme.onSurface,
          displayColor: base.colorScheme.onSurface,
        ),
      ),
    );
  }
}