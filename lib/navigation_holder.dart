import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_explorer/core/theme/util/colors.dart' as colors;

class NavigationHolder extends StatelessWidget {
   final Widget child;

  const NavigationHolder({required this.child});

  @override
  Widget build(BuildContext context) {
    // current route path
    final location = GoRouter.of(context).state.uri.toString();


    int currentIndex = () {
      if (location.startsWith('/home')) return 0;
      if (location.startsWith('/explore')) return 1;
      if (location.startsWith('/profile')) return 2;
      return 0;
    }();

    return Scaffold(
      body: Padding(padding: const EdgeInsetsGeometry.only(top: 16,bottom: 16,left: 16,right: 16),child: child),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                context.go('/explore');
                break;
              case 2:
                context.go('/profile');
                break;
            }
          },
          items: [
            BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_home.svg",colorFilter: ColorFilter.mode(currentIndex == 0 ? colors.blue100 : colors.gray700, BlendMode.srcATop))),label: "Home"),
            BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_explore.svg",colorFilter: ColorFilter.mode(currentIndex == 1 ? colors.blue100 : colors.gray700, BlendMode.srcATop))),label: "Explore"),
            BottomNavigationBarItem(icon: SizedBox(height: 24,width: 24,child: SvgPicture.asset("assets/images/ic_nav_profile.svg",colorFilter: ColorFilter.mode(currentIndex == 2 ? colors.blue100 : colors.gray700, BlendMode.srcATop))),label: "Profile"),
          ],
        ),
      ),
    );
  }
}


