import 'package:flutter/material.dart';
import 'package:proyecto1/screens/clon_screen.dart';
import 'package:proyecto1/screens/dashboard_screen.dart';
import 'package:proyecto1/screens/login_screen.dart';
import 'package:proyecto1/screens/movies_screens.dart';
import 'package:proyecto1/screens/onboarding.dart';
import 'package:proyecto1/screens/preferences_drawer_screen.dart';
import 'package:proyecto1/screens/preferences_screen.dart';
import 'package:proyecto1/utils/global_vales.dart';
import 'package:proyecto1/utils/material_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

//void main() => runApp(const MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? selectedFont = prefs.getString('selectedFont');

  GlobalValues.selectedFontFamily.value = selectedFont ?? 'Arimo';

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.flagThemeDark,
      builder: (context, isDarkTheme, child) {
        return ValueListenableBuilder(
          valueListenable: GlobalValues.selectedFontFamily,
          builder: (context, selectedFontFamily, child) {
            return MaterialApp(
              title: 'Movies App',
              home: const LoginScreen(),
              theme: isDarkTheme
                  ? MaterialTheme(_buildTextTheme(selectedFontFamily)).dark()
                  : MaterialTheme(_buildTextTheme(selectedFontFamily)).light(),
              routes: {
                "/home": (context) => const DashboardScreen(),
                "/movies": (context) => const MoviesScreen(),
                "/onboarding": (context) => const OnBoardingScreen(),
                "/preferences": (context) => const PreferencesScreen(),
                "/preferences_drawer": (context) => const PreferencesDrawerScreen(),
                "/clone": (context) => const CloneScreen(),
              },
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }

  TextTheme _buildTextTheme(String fontFamily) {
    return TextTheme(
      bodySmall: TextStyle(fontFamily: fontFamily),
      bodyMedium: TextStyle(fontFamily: fontFamily),
      bodyLarge: TextStyle(fontFamily: fontFamily),
      headlineSmall: TextStyle(fontFamily: fontFamily),
      headlineMedium: TextStyle(fontFamily: fontFamily),
      headlineLarge: TextStyle(fontFamily: fontFamily),
    );
  }
}
