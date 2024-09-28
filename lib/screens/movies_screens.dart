import 'package:flutter/material.dart';
import 'package:proyecto1/database/movies_database.dart';
import 'package:proyecto1/models/movies_dao.dart';
import 'package:proyecto1/views/movie_form_view.dart';
import 'package:proyecto1/views/movie_view_item.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesDatabase moviesDB;

  @override
  void initState() {
    super.initState();
    moviesDB = MoviesDatabase();
  }

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
        actions: [
          IconButton(
              onPressed: () {
                WoltModalSheet.show(
                  context: context,
                  pageListBuilder: (context) =>
                      [WoltModalSheetPage(child: const MovieView())],
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: FutureBuilder(
          future: moviesDB.SELECT(),
          builder: (context, AsyncSnapshot<List<MoviesDAO>?> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                    child:
                        Text("No hay películas disponibles por el momento."));
              }

              return ListView.builder(
                itemCount: snapshot.data!.length, // Especifica el itemCount
                itemBuilder: (context, index) {
                  return MovieViewItem(moviesDao: snapshot.data![index]);
                },
              );
            } else {
              if (snapshot.hasError) {
                //print(snapshot.toString());
                return const Center(child: Text("Algo salió mal :("));
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          }),
    );
  }
}
