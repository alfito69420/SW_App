import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/color_picker_service.dart';
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

  Future<void> _saveSelectedColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedColor', color.value.toRadixString(16));
  }

  Future<void> _saveCustomThemeEnabled(bool enabled) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('customThemeEnabled', enabled);
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

  final ColorPickerService _colorPickerService =
      ColorPickerService(); // Instancia el servicio
  ColorSwatch? _mainColor = Colors.blue;

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
                      () async {
                        // Desactiva el tema personalizado
                        GlobalValues.customThemeEnabled.value = false;
                        await _saveCustomThemeEnabled(false);

                        // Activa el tema claro
                        GlobalValues.flagThemeDark.value = false;
                        await _saveSelectedTheme(false);

                        setState(() {});
                        print(
                            "Custom theme enabled(PD): ${GlobalValues.customThemeEnabled.value}");
                        print(
                            "Dark theme enabled (PD): ${GlobalValues.flagThemeDark.value}");
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    themeButton(
                      "Tema Oscuro",
                      Colors.black,
                      Colors.white,
                      () async {
                        GlobalValues.customThemeEnabled.value =false; // Desactivar el tema personalizado
                        await _saveCustomThemeEnabled(false); // Guardar preferencia
                        GlobalValues.flagThemeDark.value =true; // Activar tema oscuro
                        await _saveSelectedTheme(true); // Guardar tema oscuro



                        print(
                            "Custom theme enabled(PD): ${GlobalValues.customThemeEnabled.value}");
                        print(
                            "Dark theme enabled (PD): ${GlobalValues.flagThemeDark.value}");
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    themeButton(
                      "Tema Personalizado",
                      Colors.black38,
                      Colors.white,
                      () async {
                        GlobalValues.flagThemeDark.value = false;
                        GlobalValues.customThemeEnabled.value =true; // Habilitar tema personalizado
                        await _saveCustomThemeEnabled(true); // Guardar preferencia
                        await _saveSelectedTheme(false); // Guardar tema claro

                        print("Se activo customTheme: ${GlobalValues.customThemeEnabled.value}");
                        print("Se desactivo darkTheme: ${GlobalValues.flagThemeDark.value}");
                        _colorPickerService.openColorPicker(
                          context: context,
                          onMainColorSelected:
                              (ColorSwatch? newMainColor) async {
                            setState(() {
                              _mainColor = newMainColor;

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

                              _saveSelectedColor(_mainColor!);
                            });
                          },
                        );
                      },
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
