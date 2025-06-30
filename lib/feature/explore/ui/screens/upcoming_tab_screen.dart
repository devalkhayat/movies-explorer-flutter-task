import 'package:flutter/material.dart';
import 'package:movies_explorer/feature/explore/ui/screens/widgets/upcoming_movies_section.dart';

class UpcomingTabScreen extends StatelessWidget {
  const UpcomingTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child:  Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            UpcomingMoviesSection(),

          ],
        ),
      ),
    );
  }

}
