import 'package:flutter/material.dart';
import 'package:proyecto1/screens/dashboard_screen.dart';
import 'package:proyecto1/screens/login_screen.dart';
import 'package:proyecto1/utils/material_theme.dart';
import 'package:proyecto1/utils/global_vales.dart';
//import 'package:proyecto1/utils/theme_settings.dart';
//import '';

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
            //backgroundColor: defaultColorScheme.primaryContainer,
            home: const LoginScreen(),
            theme: value
                ? const MaterialTheme(TextTheme()).dark()  // Esquema oscuro
                : const MaterialTheme(TextTheme()).light(), // Esquema claro
            routes: {
              "/home": (context) => const DashboardScreen(),
            },
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
