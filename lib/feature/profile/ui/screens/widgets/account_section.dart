import 'package:flutter/material.dart';
import 'package:movies_explorer/core/widgets/IconRound.dart';
import 'package:movies_explorer/feature/profile/ui/profile_strings.dart';

import '../../../../../core/widgets/IconImage.dart';
import '../model/menu_item.dart';
import '../../../../../core/theme/util/colors.dart' as colors;

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(ProfileStrings.accountSectionTitle,style: Theme.of(context).textTheme.titleLarge,),
        const SizedBox(height: 16,),
        ListView.separated(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: accountItems.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16), // Space,
          itemBuilder: (context, index) {
            return itemCard(context, accountItems[index]);
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
