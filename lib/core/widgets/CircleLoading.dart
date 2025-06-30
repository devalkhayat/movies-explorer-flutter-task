import 'package:flutter/material.dart';

class Circleloading extends StatelessWidget {
  const Circleloading({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CircularProgressIndicator( color: Colors.blue,             // progress color
      backgroundColor: Colors.grey,
      strokeWidth: 6.0,             );
  }
}
