import 'package:flutter/material.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/keys.dart';
import 'package:provider/provider.dart';

class NavBarMob extends StatefulWidget {
  final String isTextstyleType;
  const NavBarMob({super.key, required this.isTextstyleType});

  @override
  State<NavBarMob> createState() => _NavBarMobState();
}

class _NavBarMobState extends State<NavBarMob> {
  DarkThemeProvider? themeChange;
  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return desktopNavBar();
  }

  Widget desktopNavBar() {
    return Container(
      height: 60,
      color: (themeChange!.darkTheme
              ? AppColor.blackColor
              : AppColor.navBarBackGround)
          .withOpacity(0.9),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [navLogo(), themeDrawer()],
          )),
    );
  }

  Widget navLogo() {
    return SizedBox(
        height: MediaQuery.of(context).size.height <= vScreenWidthMd
            ? MediaQuery.of(context).size.height / 4
            : MediaQuery.of(context).size.width <= vScreenWidthXl
                ? MediaQuery.of(context).size.width / 9
                : MediaQuery.of(context).size.height / 13,
        width: MediaQuery.of(context).size.width <= vScreenWidthMd
            ? MediaQuery.of(context).size.width / 4
            : MediaQuery.of(context).size.width <= vScreenWidthXl
                ? MediaQuery.of(context).size.width / 9
                : MediaQuery.of(context).size.width / 13,
        child: Image(
            image: AssetImage(
                "${AppImage.dashboardImage}${themeChange!.darkTheme ? "logo_darktheme.png" : "logo.png"}")));
  }

  Widget themeDrawer() {
    return GestureDetector(
      onTap: () {
        scaffoldKey.currentState!.openEndDrawer();
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: themeChange!.darkTheme == true
                ? AppColor.blackColor
                : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(5)),
        child: Icon(Icons.grid_view_rounded,
            color: themeChange!.darkTheme == true
                ? AppColor.whiteColor
                : AppColor.blackColor),
      ),
    );
  }
}
