import 'package:flutter/material.dart';

import '../../../../../core/theme/util/colors.dart' as colors;
import '../../../../../core/widgets/IconImage.dart';
import '../../../../../core/widgets/IconRound.dart';
import '../../profile_strings.dart';
import '../model/menu_item.dart';

class PrivacySection extends StatelessWidget {
  const PrivacySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ProfileStrings.privacySectionTitle,style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(height: 16,),
        ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: privacyItems.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16), // Space,
          itemBuilder: (context, index) {
            return itemCard(context, privacyItems[index]);
          },
        ),
      ],
    );
  }

  itemCard(BuildContext context, MenuItem data) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              IconRound(background: data.background, icon: data.icon),
              const SizedBox(width: 16,),
              Text(
                data.title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: colors.white100),
              ),
            ],
          ),
        ),
        IconImage(imageLocation: 'assets/images/ic_profile_go_details.svg'),
      ],
    );
  }
}
