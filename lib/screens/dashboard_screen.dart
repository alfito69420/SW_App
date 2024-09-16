import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proyecto1/screens/clon_screen.dart';
import 'package:proyecto1/screens/home_screen.dart';
import 'package:proyecto1/screens/profile_screen.dart';
import 'package:proyecto1/utils/global_vales.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;

  final _key = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColorScheme.primary,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: defaultColorScheme.onPrimary,
          ),
        ),
        //backgroundColor: ColorsSettings.navColor,
        //backgroundColor: defaultColorScheme.primaryContainer,
        title: Text(
          "SWApp",
          style: TextStyle(color: defaultColorScheme.onPrimary),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.ads_click_sharp,
                  color: defaultColorScheme.onPrimary,
                ),
                //color: Colors.white,
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
              //return const HomeScreen();
              return const CloneScreen();
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
        backgroundColor: defaultColorScheme.primary,
        color: defaultColorScheme.onPrimary,

        // activeColor: Colors.orangeAccent,
        onTap: (int i) => setState(() {
          index = i;
        }),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        type: ExpandableFabType.up,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
          //fabSize: ExpandableFabSize.large,
          //foregroundColor: Colors.white,
          //backgroundColor: const Color.fromARGB(255, 255, 85, 7),
          //shape: const CircleBorder(),
          angle: 3.14 * 2,
        ),
        closeButtonBuilder: FloatingActionButtonBuilder(
          size: 56,
          builder: (BuildContext context, void Function()? onPressed,
              Animation<double> progress) {
            return IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.check_circle_outline,
                size: 40,
              ),
            );
          },
        ),
        children: [
          FloatingActionButton.small(
            onPressed: () {
              GlobalValues.flagThemeDark.value = false;
            },
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.light_mode,
              color: Colors.black,
            ),
          ),
          FloatingActionButton.small(
            onPressed: () {
              GlobalValues.flagThemeDark.value = true;
            },
            backgroundColor: Colors.black,
            child: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
