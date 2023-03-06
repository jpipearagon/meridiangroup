class ImageConstants {

  ImageConstants._init();
  static ImageConstants? _instace;

  static ImageConstants get instance => _instace ??= ImageConstants._init();

  String get url_base => 'https://image.tmdb.org/t/p/w500/';
  String get logo => toPng('logo');

  String toPng(String name) => 'assets/images/$name.png';
}
