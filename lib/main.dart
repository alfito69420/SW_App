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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? selectedFont = prefs.getString('selectedFont');
  bool? selectedTheme = prefs.getBool('selectedTheme');
  String? selectedColorString = prefs.getString('selectedColor');
  bool? customThemeEnabled = prefs.getBool('customThemeEnabled');
  Color selectedColor = selectedColorString != null
      ? Color(int.parse('0xff$selectedColorString'))
      : Colors.blue;

  GlobalValues.selectedFontFamily.value = selectedFont ?? 'Arimo';
  GlobalValues.flagThemeDark.value = selectedTheme ?? false;
  GlobalValues.customThemeEnabled.value = customThemeEnabled ?? false;
  GlobalValues.colorScheme.value = ColorScheme(
    primary: selectedColor,
    secondary: Colors.grey,
    surface: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  );

  print("Custom theme enabled: ${GlobalValues.customThemeEnabled.value}");
  print("Dark theme enabled: ${GlobalValues.flagThemeDark.value}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (GlobalValues.customThemeEnabled.value) {
      GlobalValues.flagThemeDark.value = false;
    } else if (GlobalValues.flagThemeDark.value) {
      GlobalValues.customThemeEnabled.value = false;
    }

    return ValueListenableBuilder(
      valueListenable: GlobalValues.flagThemeDark,
      builder: (context, isDarkTheme, child) {
        return ValueListenableBuilder(
          valueListenable: GlobalValues.selectedFontFamily,
          builder: (context, selectedFontFamily, child) {
            return ValueListenableBuilder(
              valueListenable: GlobalValues.colorScheme,
              builder: (context, colorScheme, child) {
                return MaterialApp(
                  title: 'Movies App',
                  home: const LoginScreen(),
                  theme: GlobalValues.customThemeEnabled.value
                      ? MaterialTheme(_buildTextTheme(selectedFontFamily))
                          .custom(colorScheme)
                      : (isDarkTheme == true
                          ? MaterialTheme(_buildTextTheme(selectedFontFamily))
                              .dark()
                          : MaterialTheme(_buildTextTheme(selectedFontFamily))
                              .light()),
                  routes: {
                    "/home": (context) => const DashboardScreen(),
                    "/movies": (context) => const MoviesScreen(),
                    "/onboarding": (context) => const OnBoardingScreen(),
                    "/preferences": (context) => const PreferencesScreen(),
                    "/preferences_drawer": (context) =>
                        const PreferencesDrawerScreen(),
                    "/clone": (context) => const CloneScreen(),
                    "/login": (context) => const LoginScreen(),
                  },
                  debugShowCheckedModeBanner: false,
                );
              },
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
