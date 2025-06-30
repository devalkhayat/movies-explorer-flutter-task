import 'package:flutter/material.dart';
import 'package:movies_explorer/core/widgets/IconImage.dart';
import 'package:movies_explorer/feature/profile/ui/screens/widgets/account_section.dart';
import 'package:movies_explorer/feature/profile/ui/screens/widgets/privacy_section.dart';
import 'package:movies_explorer/feature/profile/ui/screens/widgets/welcome_user_section.dart';

import '../profile_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: screenAppBar(context),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16,),
            WelcomeUserSection(),
            SizedBox(height: 16,),
            Divider(thickness: 0.2,),
            SizedBox(height: 8,),
            AccountSection(),
            SizedBox(height: 8,),
            Divider(thickness: 0.2,),
            SizedBox(height: 8,),
            PrivacySection()

          ],
        ),
      ),
    );
  }



  screenAppBar(BuildContext context){
    return AppBar(
      title:  Text(ProfileStrings.screenTitle,style: Theme.of(context).textTheme.titleLarge),
      centerTitle: true,
      leading: IconButton(
        icon: IconImage(imageLocation: "assets/images/ic_back.svg",),
        onPressed: () {

        },
      ),

    );
  }

}
