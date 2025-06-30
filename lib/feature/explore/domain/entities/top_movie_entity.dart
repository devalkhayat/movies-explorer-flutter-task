import 'dart:ffi';

class TopMovieEntity {

  final int id;
  final String name;
  final double rating;
  final String imageUrl;

  TopMovieEntity({required this.id,required this.name,required this.rating,required this.imageUrl});
}