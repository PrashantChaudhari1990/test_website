import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/utils/keys.dart';
import 'package:hoster/widgets/app_button.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final String isTextstyleType;
  const NavBar({super.key, required this.isTextstyleType});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
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
        padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).size.width <= vScreenWidthLg ? 15 : 45),
        child: MediaQuery.of(context).size.width <= vScreenWidthLg
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            scaffoldKey.currentState!.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: themeChange!.darkTheme == true
                                ? AppColor.whiteColor
                                : AppColor.blackColor,
                          )),
                      sizeBoxWidth(vDefaultPadding),
                      navLogo(),
                    ],
                  ),
                  themeDrawer()
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  navLogo(),
                  MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? const SizedBox.shrink()
                      : navButton(),
                ],
              ),
      ),
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

  Widget navButton() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        hostingButton(),
        sizeBoxWidth(vDefaultPadding * 2),
        pricingButton(),
        sizeBoxWidth(vDefaultPadding * 2),
        domainButton(),
        sizeBoxWidth(vDefaultPadding * 2),
        emailButton(),
        sizeBoxWidth(vDefaultPadding * 2),
        loginButton(),
        sizeBoxWidth(vDefaultPadding * 3),
        themeDrawer()
      ],
    );
  }

  Widget hostingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              Scrollable.ensureVisible(
                introKey.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: AppText(
              text: Languages.of(context)!.home,
              color: themeChange!.darkTheme
                  ? AppColor.whiteColor
                  : AppColor.blackColor,
              style: widget.isTextstyleType,
              fontsize: 15,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }

  Widget domainButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              Scrollable.ensureVisible(
                domainKey.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: AppText(
              text: Languages.of(context)!.domain,
              color: themeChange!.darkTheme
                  ? AppColor.whiteColor
                  : AppColor.blackColor,
              style: widget.isTextstyleType,
              fontsize: 15,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }

  Widget emailButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              Scrollable.ensureVisible(
                emailKey.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: AppText(
              text: Languages.of(context)!.email,
              color: themeChange!.darkTheme
                  ? AppColor.whiteColor
                  : AppColor.blackColor,
              style: widget.isTextstyleType,
              fontsize: 15,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }

  Widget pricingButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
            onTap: () {
              Scrollable.ensureVisible(
                pricingKey.currentContext!,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            },
            child: AppText(
              text: Languages.of(context)!.pricing,
              color: themeChange!.darkTheme
                  ? AppColor.whiteColor
                  : AppColor.blackColor,
              style: widget.isTextstyleType,
              fontsize: 15,
              fontWeight: FontWeight.normal,
            )),
      ),
    );
  }

  Widget loginButton() {
    return AppButton(
        height: 30,
        width: 100,
        text: Languages.of(context)!.login,
        textcolor: AppColor.whiteColor,
        textSize: 12,
        textWeight: FontWeight.normal,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 20,
        style: widget.isTextstyleType);
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
