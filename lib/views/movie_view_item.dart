import 'package:flutter/material.dart';
import 'package:proyecto1/models/movies_dao.dart';

class MovieViewItem extends StatefulWidget {
  MovieViewItem({super.key, required this.moviesDao});

  MoviesDao moviesDao;

  @override
  State<MovieViewItem> createState() => _MovieViewItemState();
}

class _MovieViewItemState extends State<MovieViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.moviesDao.nameMovie!),
    );
  }
}
