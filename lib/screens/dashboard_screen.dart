import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:proyecto1/screens/clon_screen.dart';
import 'package:proyecto1/screens/home_screen.dart';
import 'package:proyecto1/screens/profile_screen.dart';
import 'package:proyecto1/utils/global_vales.dart';
import 'package:proyecto1/utils/image_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int index = 0;

  // Clave para el Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      key: _scaffoldKey, // Asigna la clave al Scaffold
      appBar: AppBar(
        backgroundColor: defaultColorScheme.primary,
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Abre el drawer
          },
          icon: Icon(
            Icons.menu,
            color: defaultColorScheme.onPrimary,
          ),
        ),
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
              ),
            ),
          ),
        ],
      ),
      drawer: myDrawer(), // Drawer asignado
      body: Builder(builder: (context) {
        switch (index) {
          case 0:
            return const HomeScreen();
          case 1:
            return const ProfileScreen();
          default:
            return const HomeScreen();
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
        onTap: (int i) => setState(() {
          index = i;
        }),
      ),
      /*
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        // No necesitas clave aquí para el FAB
        type: ExpandableFabType.up,
        openButtonBuilder: RotateFloatingActionButtonBuilder(
          child: const Icon(Icons.menu),
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
            heroTag: "btn2",
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
      ),*/
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(ImageStrings.networPfp),
            ),
            accountName: Text("Alfito Arámburo"),
            accountEmail: Text("equisde69420@gmail.com"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/movies");
            },
            title: const Text("Peliculas"),
            //subtitle: const Text("lorem ipsum"),
            leading: const Icon(Icons.movie),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/preferences_drawer");
            },
            title: const Text("Preferencias"),
            subtitle: const Text("Tema / Fuente"),
            leading: const Icon(Icons.room_preferences),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, "/clone");
            },
            title: const Text("CloneWars"),
            subtitle: const Text("Challenge"),
            leading: const Icon(Icons.coffee),
            trailing: const Icon(Icons.arrow_forward_ios_sharp),
          ),
        ],
      ),
    );
  }
}
