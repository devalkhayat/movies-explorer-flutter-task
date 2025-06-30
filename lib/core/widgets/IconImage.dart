import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconImage extends StatelessWidget {
  String imageLocation;
  double width;
  double height;
   IconImage({super.key,required this.imageLocation,this.width=18,this.height=18});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      imageLocation,
      width: width,
      height: height,

    );
  }
}
