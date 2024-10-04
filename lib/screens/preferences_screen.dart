import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/global_vales.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String? selectedValue;

  String? selectedFont = 'Arimo';

  // Función para actualizar el tema
  void updateFont(String? newFont) {
    setState(() {
      selectedFont = newFont;
    });
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    return [
      const DropdownMenuItem(
        child: Text(
          "Arimo",
          style: TextStyle(fontFamily: 'Arimo'),
        ),
        value: "Arimo",  // Cambia el valor a la familia de fuente
      ),
      const DropdownMenuItem(
        child: Text("Timos", style: TextStyle(fontFamily: 'Tinos')),
        value: "Tinos",
      ),
      const DropdownMenuItem(
        child: Text("Courier Prime", style: TextStyle(fontFamily: 'Courier Prime')),
        value: "Courier Prime",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Lottie.asset("assets/lottie/choose_preferences.json", width: 300),
            const Text(
              "Escoge el tema que mas te agrade",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            themeButton("Tema Luminoso", Colors.white, Colors.black),
            themeButton("Tema Oscuro", Colors.black, Colors.white),
            themeButton("Tema Personalizado", defaultColorScheme.secondary,
                defaultColorScheme.onSecondary),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Escoge la fuente que mas te agrade",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            DropdownButton(
              value: selectedValue,
              items: dropdownItems,
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
                // Actualiza la fuente seleccionada globalmente
                GlobalValues.selectedFontFamily.value = selectedValue!;
              },
              hint: const Text('Seleccione una fuente.'),
            ),
            const SizedBox(
              height: 90,
            ),
            themeButton("Finalizar Configuracion", defaultColorScheme.primary,
                defaultColorScheme.onPrimary),
          ],
        ),
      ),
    );
  }

  ElevatedButton themeButton(String tema, Color esquema, Color colorTexto) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: esquema,
        ),
        child: Text(
          tema,
          style: TextStyle(color: colorTexto),
        ));
  }
}
