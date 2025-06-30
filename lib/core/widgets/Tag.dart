import 'package:flutter/material.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class Tag extends StatelessWidget {
  final String caption;
  final Color background;
  final Color textColor;

  const Tag({super.key,required this.caption, this.background=colors.gray300,this.textColor=colors.white100});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: background, // background color
        borderRadius: BorderRadius.circular(6), // rounded corners
      ),
      child:  Text(caption,style: Theme.of(context).textTheme.labelMedium?.copyWith(color: textColor),),
    );
  }
}
