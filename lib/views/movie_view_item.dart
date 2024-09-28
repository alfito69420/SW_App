import 'package:flutter/material.dart';
import 'package:proyecto1/database/movies_database.dart';
import 'package:proyecto1/models/movies_dao.dart';
import 'package:proyecto1/utils/image_strings.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../utils/global_vales.dart';

class MovieViewItem extends StatefulWidget {
  MovieViewItem({super.key, required this.moviesDao});

  MoviesDAO moviesDao;

  @override
  State<MovieViewItem> createState() => _MovieViewItemState();
}

class _MovieViewItemState extends State<MovieViewItem> {
  MoviesDatabase? moviesDatabase;

  @override
  void initState() {
    super.initState();
    moviesDatabase = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: defaultColorScheme.secondary,
      ),
      child: Column(children: [
        Row(
          children: [
            Image.network(
              ImageStrings.movieImgTest,
              height: 100,
            ),
            Expanded(
              child: ListTile(
                title: Text(widget.moviesDao.nameMovie ?? 'Sin título'),
                // Maneja el null
                subtitle: Text(widget.moviesDao.releaseDate ??
                    'Sin fecha'), // Maneja el null
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  moviesDatabase!
                      .DELETE("tblmovies", widget.moviesDao.idMovie!)
                      .then(
                    (value) {
                      if (value > 0) {
                        GlobalValues.banUpdListMovies.value =
                            !GlobalValues.banUpdListMovies.value;
                        //Navigator.pop(context);
                        return QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            text: 'Película eliminada con éxito.',
                            showConfirmBtn: true,
                            autoCloseDuration: const Duration(seconds: 2));
                      } else {
                        //Navigator.pop(context);
                        return QuickAlert.show(
                            context: context,
                            type: QuickAlertType.error,
                            text: 'No fue posible eliminar la película.',
                            showConfirmBtn: true,
                            autoCloseDuration: const Duration(seconds: 2));
                      }
                    },
                  );
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        const Divider(),
        Text(widget.moviesDao.overview ?? 'Sin descripción'),
      ]),
    );
  }
}
