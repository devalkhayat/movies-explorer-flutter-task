import 'dart:ui';

import 'package:movies_explorer/feature/profile/ui/profile_strings.dart';
import '../../../../../core/theme/util/colors.dart' as colors;
class MenuItem{
  final String icon;
  final Color background;
  final String title;


  MenuItem({required this.icon,required this.background,required this.title});
}

List<MenuItem> accountItems=[
  MenuItem(icon: "assets/images/ic_profile_personal_data.svg",background:colors.blue200 , title: ProfileStrings.personalDataTitle),
  MenuItem(icon: "assets/images/ic_profile_email_payment.svg",background:colors.blue300 , title: ProfileStrings.emailTitle),
  MenuItem(icon: "assets/images/ic_profile_deactivate_account.svg",background:colors.red200 , title: ProfileStrings.deactivateTitle),
];

List<MenuItem> privacyItems=[
  MenuItem(icon: "assets/images/ic_profile_notification.svg",background:colors.blue200 , title: ProfileStrings.notificationsTitle),
  MenuItem(icon: "assets/images/ic_profile_your_tickets.svg",background:colors.blue300 , title: ProfileStrings.yourTicketTitle),
  MenuItem(icon: "assets/images/ic_profile_logout.svg",background:colors.red200 , title: ProfileStrings.logoutTitle),
];