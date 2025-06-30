import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class IconRound extends StatelessWidget {

  final Color background;
  final String icon;

  const IconRound({super.key, this.background=colors.gray300,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: background, // background color
        borderRadius: BorderRadius.circular(6), // rounded corners
      ),
      child: SvgPicture.asset(
        icon,
      ),

    );
  }
}
