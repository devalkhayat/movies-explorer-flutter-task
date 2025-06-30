sealed class DetailsEvent{}
class GetDetailsEvent extends DetailsEvent{
  final int id;
  GetDetailsEvent({required this.id});
}