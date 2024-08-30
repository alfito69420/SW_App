import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.people, title: 'Profile'),
        TabItem(icon: Icons.exit_to_app, title: 'Exit')
      ],
      backgroundColor: const Color.fromARGB(255, 255, 85, 7),
      activeColor:  Colors.orangeAccent,
      
      ),
    );
  }
}
