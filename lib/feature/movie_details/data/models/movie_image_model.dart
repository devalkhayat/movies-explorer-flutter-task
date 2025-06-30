import '../../../../core/constants.dart';

class MovieImageModel{
  final String filePath;
  MovieImageModel({required this.filePath});
  factory MovieImageModel.fromJson(Map<String, dynamic> json)=> MovieImageModel(filePath: basicImageUrl+json['file_path']);

}

class MovieImagesModelResponse {

  final List<MovieImageModel> images;

  MovieImagesModelResponse({required this.images});

  factory MovieImagesModelResponse.fromJson(Map<String, dynamic> json) {
    final List<MovieImageModel> tempImages = [];
    json["backdrops"].forEach((item) =>
        tempImages.add(MovieImageModel.fromJson(item)));

    return MovieImagesModelResponse(images: tempImages);
  }
}