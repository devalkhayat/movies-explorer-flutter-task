import 'package:intl/intl.dart';


extension StringToDate on String {
  String toDate() {
    DateFormat format = DateFormat('yyyy-MM-dd');
    DateTime dt = format.parse(this);
    return DateFormat('MMMM yyyy').format(dt);
  }

  String getPath(int id ){
    return this.replaceAll("{id}", "$id");
  }
  String getPathSearch(String keyword,int page ){
    return this.replaceAll("{qr}", "$keyword").replaceAll("{pg}", "$page");
  }

}