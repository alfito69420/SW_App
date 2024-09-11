class MoviesDao {
  final int? idMovie;
  final String? nameMovie;
  final String? overView;
  final int? idGenre;
  final String? imgMovie;
  final String? releaseDate;

  const MoviesDao(
      {required this.idMovie,
      required this.nameMovie,
      required this.overView,
      required this.idGenre,
      required this.imgMovie,
      required this.releaseDate});

  factory MoviesDao.fromMap(Map<String, dynamic> movie) {
    return MoviesDao(
        idMovie: movie['id_movie'],
        nameMovie: movie['name_movie'],
        overView: movie['over_view'],
        idGenre: movie['id_genre'],
        imgMovie: movie['img_movie'],
        releaseDate: movie['release_date']);
  }
}
