import 'package:flutter/material.dart';
import 'package:movies_explorer/core/widgets/IconImage.dart';
import 'package:movies_explorer/core/widgets/RoundImage.dart';

import '../../../../../core/theme/util/colors.dart' as colors;
import '../../profile_strings.dart';

class WelcomeUserSection extends StatelessWidget {
  const WelcomeUserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundImage(width: 48,height: 48,round: 12,urlLocation: 'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?semt=ais_hybrid&w=740',),


           Expanded(
            flex: 1,
            child: Padding(
             padding: const EdgeInsets.only(left:8.0,right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mohammed Alkhayat",style:Theme.of(context).textTheme.titleMedium?.copyWith(color:colors.white100 ),),
                  Text("Film Maker",style:Theme.of(context).textTheme.labelMedium?.copyWith(color:colors.gray200 ),),
                ],),
            ),
          ),
        

        IconImage(imageLocation: "assets/images/ic_profile_go_details.svg",)
        ,


      ],
    );
  }
}
