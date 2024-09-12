import 'package:flutter/material.dart';
import 'package:proyecto1/utils/image_strings.dart';
import 'package:proyecto1/utils/text_strings.dart';

import '../utils/material_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final defaultColorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                          image: AssetImage(
                              "assets/images/profile/profile_pic.jpg"))),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: defaultColorScheme.primary,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 18.0,
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              TextStrings.nickname,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              TextStrings.pfDescripcion,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            SizedBox(
              height: 10,
            ),
            ProfileMenuWidget(
              title: TextStrings.nombre,
              icon: Icon(Icons.person),
              onPress: () {},
              endIcon: false,
            ),
            const SizedBox(
              height: 30,
            ),
            ProfileMenuWidget(
              title: TextStrings.email,
              icon: Icon(Icons.email),
              onPress: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            ProfileMenuWidget(
              title: TextStrings.telefono,
              icon: Icon(Icons.phone),
              onPress: () {},
            ),
            const SizedBox(
              height: 30,
            ),
            ProfileMenuWidget(
              title: TextStrings.github,
              icon: Icon(Icons.web),
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  ProfileMenuWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress,
      this.endIcon = true,
      this.textColor});

  final String title;
  final Icon icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: icon,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                size: 18.0,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
