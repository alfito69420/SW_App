import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/color_picker_service.dart';
import '../utils/global_vales.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _loadSelectedFont(); // Cargar la fuente al iniciar la pantalla
  }

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
        value: "Arimo",
        child: Text(
          "Arimo",
          style: TextStyle(fontFamily: 'Arimo'),
        ), // Cambia el valor a la familia de fuente
      ),
      const DropdownMenuItem(
        value: "Tinos",
        child: Text("Timos", style: TextStyle(fontFamily: 'Tinos')),
      ),
      const DropdownMenuItem(
        value: "Courier Prime",
        child: Text("Courier Prime",
            style: TextStyle(fontFamily: 'Courier Prime')),
      ),
    ];
  }

  Future<void> _saveSelectedFont(String font) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', font);
  }

  Future<void> _saveSelectedTheme(bool theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('selectedTheme', theme);
  }

  Future<void> _loadSelectedFont() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? font = prefs.getString('selectedFont');

    if (font != null) {
      setState(() {
        selectedValue = font;
        GlobalValues.selectedFontFamily.value =
            font; // Actualiza también el ValueNotifier global
      });
    }
  }

  Future<void> _saveSelectedColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedColor', color.value.toRadixString(16));
  }

  Future<void> _saveCustomThemeEnabled(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('customThemeEnabled', enabled);
  }

  final ColorPickerService _colorPickerService =
      ColorPickerService(); // Instancia el servicio
  ColorSwatch? _mainColor = Colors.blue;

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
            themeButton(
              "Tema Luminoso",
              Colors.white,
              Colors.black,
              () {
                GlobalValues.customThemeEnabled.value = false;
                GlobalValues.flagThemeDark.value = false;
                _saveSelectedTheme(false);
              },
            ),
            themeButton(
              "Tema Oscuro",
              Colors.black,
              Colors.white,
              () {
                GlobalValues.customThemeEnabled.value = false;
                GlobalValues.flagThemeDark.value = true;
                _saveSelectedTheme(true);
              },
            ),
            themeButton(
              "Tema Personalizado",
              Colors.black38,
              Colors.white,
              () {
                GlobalValues.flagThemeDark.value = false;
                GlobalValues.customThemeEnabled.value =
                    true; // Habilitar tema personalizado
                _saveCustomThemeEnabled(true); // Guardar preferencia
                _colorPickerService.openColorPicker(
                  context: context,
                  onMainColorSelected: (ColorSwatch? newMainColor) {
                    setState(() {
                      _mainColor = newMainColor;

                      _saveSelectedColor(_mainColor!);

                      // Actualiza el esquema de colores en el ValueNotifier
                      GlobalValues.colorScheme.value = ColorScheme(
                        primary: _mainColor!,
                        secondary: Colors.grey,
                        surface: Colors.white,
                        background: Colors.white,
                        error: Colors.red,
                        onPrimary: Colors.white,
                        onSecondary: Colors.black,
                        onSurface: Colors.black,
                        onBackground: Colors.black,
                        onError: Colors.white,
                        brightness: Brightness.light,
                      );
                    });
                  },
                );
              },
            ),
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
                _saveSelectedFont(selectedValue!);
              },
              hint: const Text('Seleccione una fuente.'),
            ),
            const SizedBox(
              height: 90,
            ),
            themeButton(
              "Finalizar Configuracion",
              defaultColorScheme.primary,
              defaultColorScheme.onPrimary,
              () {
                Navigator.pushNamed(context, "/home");
              },
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton themeButton(
      String tema, Color esquema, Color colorTexto, VoidCallback onPress) {
    return ElevatedButton(
        onPressed:
            onPress /*() {
          if (ruta!.isNotEmpty) {
            Navigator.pushNamed(context, ruta);
          }
        }*/
        ,
        style: ElevatedButton.styleFrom(
          backgroundColor: esquema,
        ),
        child: Text(
          tema,
          style: TextStyle(color: colorTexto),
        ));
  }
}
