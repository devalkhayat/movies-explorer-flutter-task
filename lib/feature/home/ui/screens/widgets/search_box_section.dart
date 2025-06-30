import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/feature/home/ui/util/home_strings.dart';

import '../../../../../core/theme/theme_data/styles.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class SearchBoxSection extends StatelessWidget {
  const SearchBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Theme(
        data: ThemeData(inputDecorationTheme: Styles.inputSearchDeco),
        child: TextField(
          style: const TextStyle(color: colors.white100),
          textInputAction: TextInputAction.search,
            onSubmitted: (value) {
            if(value.isNotEmpty){
              GoRouter.of(context).push("/search_result/${value}");
              }
            },
          decoration: InputDecoration(
              hintText: HomeStrings.searchInputPlaceHolder,
              prefixIcon: IconButton(
                  onPressed: () => {},
                  icon: SvgPicture.asset("assets/images/ic_search.svg"))),
        ),
      ),
    );
  }
}
