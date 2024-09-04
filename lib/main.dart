import 'package:flutter/material.dart';
import 'package:proyecto1/screens/dashboard_screen.dart';
import 'package:proyecto1/screens/login_screen.dart';
import 'package:proyecto1/utils/global_vales.dart';
import 'package:proyecto1/utils/theme_settings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: GlobalValues.flagThemeDark,
        builder: (context, value, child) {
          return MaterialApp(
            title: 'SW App',
            home: const LoginScreen(),
            theme: value
                ? ThemeSettings.darkTheme(context)
                : ThemeSettings.lightTheme(context),
            routes: {
              "/home": (context) => const DashboardScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
