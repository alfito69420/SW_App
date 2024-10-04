import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/global_vales.dart';

class PreferencesDrawerScreen extends StatefulWidget {
  const PreferencesDrawerScreen({super.key});

  @override
  State<PreferencesDrawerScreen> createState() =>
      _PreferencesDrawerScreenState();
}

class _PreferencesDrawerScreenState extends State<PreferencesDrawerScreen> {
  String? selectedValue;

  /*  SHARED PREFERENCES  */
  Future<void> _saveSelectedFont(String font) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', font);
  }

  Future<void> _saveSelectedTheme(bool theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('selectedTheme', theme);
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    return [
      const DropdownMenuItem(
        child: Text(
          "Arimo",
          style: TextStyle(fontFamily: 'Arimo'),
        ),
        value: "Arimo", // Cambia el valor a la familia de fuente
      ),
      const DropdownMenuItem(
        child: Text("Timos", style: TextStyle(fontFamily: 'Tinos')),
        value: "Tinos",
      ),
      const DropdownMenuItem(
        child: Text("Courier Prime",
            style: TextStyle(fontFamily: 'Courier Prime')),
        value: "Courier Prime",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Fuente",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                DropdownButton(
                  value: selectedValue,
                  items: dropdownItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                    // Actualiza la fuente seleccionada globalmente
                    GlobalValues.selectedFontFamily.value = selectedValue!;
                    _saveSelectedFont(selectedValue!);
                  },
                  hint: const Text('Seleccione una fuente.'),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              children: [
                const Text(
                  "Tema",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Column(
                  children: [
                    themeButton(
                      "Tema Luminoso",
                      Colors.white,
                      Colors.black,
                      () {
                        GlobalValues.flagThemeDark.value = false;
                        _saveSelectedTheme(false);
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    themeButton(
                      "Tema Oscuro",
                      Colors.black,
                      Colors.white,
                      () {
                        GlobalValues.flagThemeDark.value = true;
                        _saveSelectedTheme(true);
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    themeButton(
                      "Tema Personalizado",
                      defaultColorScheme.secondary,
                      defaultColorScheme.onSecondary,
                      () {},
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton themeButton(
      String tema, Color esquema, Color colorTexto, VoidCallback onPress) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: esquema,
        ),
        child: Text(
          tema,
          style: TextStyle(color: colorTexto),
        ));
  }
}
