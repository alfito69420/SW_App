import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class ColorPickerService {
  // Variables para almacenar los colores seleccionados
  ColorSwatch? mainColor = Colors.blue;
  Color? shadeColor = Colors.blue[800];

  // Métodos para abrir los selectores de colores
  Future<void> openColorPicker({
    required BuildContext context,
    required ValueChanged<ColorSwatch?> onMainColorSelected,
  }) async {
    ColorSwatch? tempMainColor;

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Tema Personzalizado"),
          content: MaterialColorPicker(
            selectedColor: shadeColor,
            onMainColorChange: (color) => tempMainColor = color,
          ),
          actions: [
            TextButton(
              child: const Text('Cancelar'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: const Text('Confirmar'),
              onPressed: () {
                Navigator.of(context).pop();
                if (tempMainColor != null) {
                  onMainColorSelected(tempMainColor);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
