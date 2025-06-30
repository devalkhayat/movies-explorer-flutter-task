import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
   double width;
   double height;
   double round;
   String urlLocation;
   bool isNetwork;
   RoundImage({super.key, this.width=315, this.height=237,this.round=12,this.urlLocation="https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?semt=ais_hybrid&w=740",this.isNetwork=true});

  @override
  Widget build(BuildContext context) {


    return ClipRRect(
      borderRadius: BorderRadius.circular(round), // Adjust the corner radius
      child: widgetType(),
    ); ClipOval(
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/images/placeholder.jpg',
        image: urlLocation,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );  /*Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(round),
        image:  DecorationImage(
          image: NetworkImage(urlLocation),
          fit: BoxFit.cover,
        ),
      ),
    );*/
  }

  widgetType(){

    if(isNetwork){

      return FadeInImage.assetNetwork(
        placeholder: 'assets/images/placeholder.jpg',
        image: urlLocation,
        fit: BoxFit.cover,
        width: width,
        height: height,
        fadeInDuration: const Duration(milliseconds: 100),
        fadeOutDuration: const Duration(milliseconds: 100), // Optional fade-out speed
      );
    }else{
      return Image.asset('assets/images/placeholder_error.jpg');
    }

  }
}
