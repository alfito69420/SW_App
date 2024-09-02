import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto1/screens/home_screen.dart';
import 'package:proyecto1/screens/profile_screen.dart';
import 'package:proyecto1/utils/colors_settings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.white,
        ),
        backgroundColor: ColorsSettings.navColor,
        title: const Text(
          "SWApp",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.ads_click_sharp),
                color: Colors.white,
              ),
            ),
          ),
          //Image.asset("/")  //  Icono de la derecha
        ],
      ),
      body: Builder(builder: (context) {
        {
          switch (index) {
            case 0:
              return const HomeScreen();
            case 1:
              return const ProfileScreen();
            //case 2: const;
            default:
              return const HomeScreen();
          }
        }
      }),
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
          TabItem(icon: Icons.exit_to_app, title: 'Exit')
        ],
        backgroundColor: const Color.fromARGB(255, 255, 85, 7),
        activeColor: Colors.orangeAccent,
        onTap: (int i) => setState(() {
          index = i;
        }),
      ),
    );
  }
}
