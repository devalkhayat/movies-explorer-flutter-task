class MovieDetailsEntity{
  final int id;
  final String title;
  final String date;
  final double rating;
  final bool adult;
  final String originalLanguage;
  final String overView;
  final List<MovieCategory> categories;
  MovieDetailsEntity( {required this.id,required this.title,required this.date,required this.rating,required this.adult,required this.originalLanguage,required this.overView,required this.categories});

}
class MovieCategory{
  final String name;

  MovieCategory({required this.name});
}