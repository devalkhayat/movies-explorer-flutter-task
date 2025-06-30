import 'package:flutter/material.dart';
import 'package:movies_explorer/feature/home/ui/util/home_strings.dart';
import '../../../../../core/theme/util/colors.dart';
import '../../../../../core/widgets/RoundImage.dart';

class WelcomeBoxSection extends StatelessWidget {
  const WelcomeBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(HomeStrings.greetingUser,style:Theme.of(context).textTheme.labelMedium?.copyWith(color:gray200 ),),
            Text("Mohammed Alkhayat",style:Theme.of(context).textTheme.titleMedium?.copyWith(color:white100 ),)
          ],),
        )
        ,
        RoundImage(width: 48,height: 48,round: 10,urlLocation: 'https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?semt=ais_hybrid&w=740',)
      ],
    );
  }
}
