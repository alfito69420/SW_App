class OnBoardingContent {
  String image;
  String title;
  String discription;

  OnBoardingContent(
      {required this.image, required this.title, required this.discription});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: 'Explora lo Mejor del Cine y la TV',
      image: 'assets/lottie/movie_onboardin_1.json',
      discription:
          "Descubre un catálogo personalizado con las mejores películas y series, todo en un solo lugar."),
  OnBoardingContent(
      title: 'Recomendaciones Solo para Ti',
      image: 'assets/lottie/movie_onboarding_2.json',
      discription:
          "Déjanos conocerte mejor para ofrecerte contenido que realmente te encantará."),
  OnBoardingContent(
      title: 'Disfruta Sin Límites',
      image: 'assets/lottie/movie_onboarding_3.json',
      discription:
          "Transmite, descarga y guarda tus favoritos para ver cuando quieras, donde quieras."),
];
