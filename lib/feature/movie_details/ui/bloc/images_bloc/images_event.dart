sealed class ImagesEvent{}
class GetImagesEvent extends ImagesEvent{
  final int id;
  GetImagesEvent({required this.id});
}