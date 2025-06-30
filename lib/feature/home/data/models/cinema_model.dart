import 'package:movies_explorer/feature/home/domain/entities/cinema_entity.dart';

class CinemaModel extends CinemaEntity{

  CinemaModel({required int id ,required String name,required String distance,required String closeTime,required String logoUrl,required String rating}):super(id:id, name:name, distance:distance,closeTime: closeTime,logoUrl: logoUrl,rating: rating);

  factory CinemaModel.fromMap(Map<String, dynamic> map) {
    return CinemaModel(id: map['ID'], name: map['NAME'],distance: map['DISTANCE'], closeTime: map['CLOSE_TIME'],logoUrl: map['LOGO_URL'],rating: map['RATING']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name,'distance':distance,'close_time':closeTime,'logo_url':logoUrl,'rating':rating};
  }
}