import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../database/movies_database.dart';
import '../models/movies_dao.dart';
import '../utils/global_vales.dart';

class MovieView extends StatefulWidget {
  MovieView({super.key, this.moviesDAO});

  MoviesDAO? moviesDAO;

  @override
  State<MovieView> createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView> {
  TextEditingController conName = TextEditingController();
  TextEditingController conOverview = TextEditingController();
  TextEditingController conImgMovie = TextEditingController();
  TextEditingController conRelease = TextEditingController();
  MoviesDatabase? moviesDatabase;

  @override
  void initState() {
    super.initState();
    moviesDatabase = MoviesDatabase();

    if (widget.moviesDAO != null) {
      conName.text = widget.moviesDAO!.nameMovie!;
      conOverview.text = widget.moviesDAO!.overview!;
      conImgMovie.text = widget.moviesDAO!.imgMovie!;
      conRelease.text = widget.moviesDAO!.releaseDate!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    final txtNameMovie = TextFormField(
      controller: conName,
      decoration: const InputDecoration(hintText: 'Nombre de la película'),
    );
    final txtOverview = TextFormField(
      controller: conOverview,
      maxLines: 5,
      decoration: const InputDecoration(hintText: 'Sinapsis de la película'),
    );
    final txtImgMovie = TextFormField(
      controller: conImgMovie,
      decoration: const InputDecoration(hintText: 'Poster de la película'),
    );
    final txtRelease = TextFormField(
      readOnly: true,
      controller: conRelease,
      decoration: const InputDecoration(hintText: 'Fecha de lanzamiento'),
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2050));

        if (pickedDate != null) {
          String formatDate = DateFormat('dd-MM-yyyy').format(pickedDate);
          conRelease.text = formatDate;
          setState(() {});
        }
      },
    );

    final btnSave = ElevatedButton(
      onPressed: () {
        moviesDatabase!.INSERT('tblmovies', {
          "nameMovie": conName.text,
          "overview": conOverview.text,
          "idGenre": 1,
          "imgMovie": conImgMovie.text,
          "releaseDate": conRelease.text
        }).then((value) {
          if (value > 0) {
            GlobalValues.banUpdListMovies.value =
                !GlobalValues.banUpdListMovies.value;

            Navigator.pop(context);
            return QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              text: 'Pelicula agregada con exito!',
              autoCloseDuration: const Duration(seconds: 2),
              showConfirmBtn: true,
            );
          } else {
            Navigator.pop(context);
            return QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              text: 'No se pudo agregar la pelicula! :()',
              autoCloseDuration: const Duration(seconds: 2),
              showConfirmBtn: true,
            );
          }
        });
      },
      style:
          ElevatedButton.styleFrom(backgroundColor: defaultColorScheme.primary),
      child: Text(
        'Guardar',
        style: TextStyle(color: defaultColorScheme.onPrimary),
      ),
    );

    return ListView(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      children: [
        txtNameMovie,
        txtOverview,
        txtImgMovie,
        txtRelease,
        const SizedBox(
          height: 30,
        ),
        btnSave
      ],
    );
  }
}
