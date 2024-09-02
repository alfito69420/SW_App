import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:proyecto1/screens/profile_screen.dart';
import 'package:proyecto1/utils/colors_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            case 1:
              return const ProfileScreen();
            //case 2: const;
            default:
              return const ProfileScreen();
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
