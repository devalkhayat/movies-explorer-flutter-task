import 'package:movies_explorer/feature/home/domain/entities/cinema_entity.dart';

sealed class CinemasEvent{}
class GetCinemasEvent extends CinemasEvent{}
class CashCinemasEvent extends CinemasEvent{
  List<CinemaEntity> cinemasList;
  CashCinemasEvent({required this.cinemasList});
}