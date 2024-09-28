import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto1/database/movies_database.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MovieView extends StatefulWidget {
  const MovieView({super.key});

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  TextEditingController txtConName = TextEditingController();
  TextEditingController txtConOverView = TextEditingController();
  TextEditingController txtConImageMovie = TextEditingController();
  TextEditingController txtConRelease = TextEditingController();
  MoviesDatabase? moviesDB;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    final txtNameMovie = TextFormField(
      controller: txtConName,
      decoration: const InputDecoration(hintText: "Nombre de la película"),
    );
    final txtOverView = TextFormField(
      controller: txtConOverView,
      maxLines: 5,
      decoration: const InputDecoration(hintText: "Sinápsis de la película"),
    );
    final txtImageMovie = TextFormField(
      controller: txtConImageMovie,
      decoration: const InputDecoration(hintText: "Poster de la película"),
    );
    final txtRelease = TextField(
      readOnly: true,
      controller: txtConRelease,
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2050));

        if (pickedDate != null) {
          String formatDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          txtConRelease.text = formatDate;

          setState(() {});
        } else {}
      },
      decoration: const InputDecoration(hintText: "Fecha de lanzamiento"),
    );

    final btnSave = ElevatedButton(
      onPressed: () {
        moviesDB!.INSERT("tblmovies", {
          "nameMovie": txtConName.text,
          "overview": txtConOverView.text,
          "idGenre": 1,
          "imgMovie": txtConImageMovie.text,
          "releaseDate": txtConRelease.text,
        }).then(
          (value) {
            if (value > 0) {
              Navigator.pop(context);
              return QuickAlert.show(
                context: context,
                type: QuickAlertType.success,
                text: 'Película agregada con éxito.',
                showConfirmBtn: false,
                autoCloseDuration: const Duration(seconds: 2)
                
              );
              
            } else {
              Navigator.pop(context);
              return QuickAlert.show(
                context: context,
                type: QuickAlertType.error,
                text: 'No fue posible agregar la película.',
                showConfirmBtn: false,
                autoCloseDuration: const Duration(seconds: 2)
              );
            }
          },
        );
      },
      style:
          ElevatedButton.styleFrom(backgroundColor: defaultColorScheme.primary),
      child: const Text(
        "Guardar",
      ),
    );

    return ListView(
      padding: const EdgeInsets.all(12),
      shrinkWrap: true,
      children: [
        txtNameMovie,
        txtOverView,
        txtImageMovie,
        txtRelease,
        const SizedBox(
          height: 30,
        ),
        btnSave
      ],
    );
  }
}
