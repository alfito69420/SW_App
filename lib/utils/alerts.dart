import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Alerts extends StatelessWidget {
  const Alerts({super.key});

  @override
  Widget build(BuildContext context) {
    //return showAlert(context);
    return const Center();
  }
  
    Future<void> showAlert(BuildContext context) async {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      text: 'Película eliminada con éxito.',
      showConfirmBtn: false,
      autoCloseDuration: const Duration(seconds: 2),
    );
  }
}
