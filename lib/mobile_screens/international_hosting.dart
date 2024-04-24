import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class InternationalHostingMob extends StatefulWidget {
  final String isTextstyleType;
  const InternationalHostingMob({super.key, required this.isTextstyleType});

  @override
  State<InternationalHostingMob> createState() => IinternationalStateHosting();
}

class IinternationalStateHosting extends State<InternationalHostingMob> {
  DarkThemeProvider? themeChange;

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.asset(
                        "${AppImage.internationHostingImage}vector2.png",
                        fit: BoxFit.contain,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 20, right: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    heading(),
                    sizeBoxHeight(MediaQuery.of(context).size.height <=
                            vScreenWidthSm
                        ? vDefaultPadding * 1
                        : MediaQuery.of(context).size.height <= vScreenWidthMd
                            ? vDefaultPadding * 2
                            : vDefaultPadding * 7),
                    MediaQuery.of(context).size.width <= vScreenWidthSm
                        ? detailsListMob()
                        : grid()
                  ],
                ),
              ),
            ),
          ],
        ),
        sizeBoxHeight(vDefaultPadding),
      ],
    );
  }

  Widget heading() {
    return AppText(
      text: Languages.of(context)!.internationalHosting,
      style: widget.isTextstyleType,
      textCenter: true,
      fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 13
          : MediaQuery.of(context).size.width <= vScreenWidthLg
              ? 25
              : MediaQuery.of(context).size.width <= vScreenWidthXl ||
                      MediaQuery.of(context).size.width <= vScreenWidthXl1
                  ? MediaQuery.of(context).size.width / 40
                  : MediaQuery.of(context).size.width / 50,
      fontWeight: FontWeight.w500,
    );
  }

  Widget grid() {
    return SizedBox(
      height: 300,
      width: 800,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
          dragDevices: {PointerDeviceKind.unknown},
        ),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 30,
              crossAxisSpacing: 30,
              mainAxisExtent: 100),
          children: [
            leadingText(),
            dataCard(
              "${AppImage.internationHostingImage}safety.png",
              Languages.of(context)!.dataSafety,
              Languages.of(context)!.internationalCarddiscription,
            ),
            dataCard(
              "${AppImage.internationHostingImage}security.png",
              Languages.of(context)!.addedSecurity,
              Languages.of(context)!.internationalCarddiscription,
            ),
            dataCard(
              "${AppImage.internationHostingImage}tool.png",
              Languages.of(context)!.seoTools,
              Languages.of(context)!.internationalCarddiscription,
            )
          ],
        ),
      ),
    );
  }

  Widget detailsListMob() {
    return Column(
      children: [
        leadingText(),
        sizeBoxHeight(vDefaultPadding),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: vDefaultPadding / 2),
          child: dataCard(
            "${AppImage.internationHostingImage}safety.png",
            Languages.of(context)!.dataSafety,
            Languages.of(context)!.internationalCarddiscription,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: vDefaultPadding / 2),
          child: dataCard(
            "${AppImage.internationHostingImage}security.png",
            Languages.of(context)!.addedSecurity,
            Languages.of(context)!.internationalCarddiscription,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: vDefaultPadding / 2),
          child: dataCard(
            "${AppImage.internationHostingImage}tool.png",
            Languages.of(context)!.seoTools,
            Languages.of(context)!.internationalCarddiscription,
          ),
        )
      ],
    );
  }

  Widget leadingText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: AppText(
            text: Languages.of(context)!.levelUp,
            style: widget.isTextstyleType,
            textCenter: MediaQuery.of(context).size.width <= vScreenWidthSm
                ? true
                : false,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
                ? MediaQuery.of(context).size.width / 20
                : MediaQuery.of(context).size.width <= vScreenWidthMd
                    ? MediaQuery.of(context).size.width / 35
                    : MediaQuery.of(context).size.width <= vScreenWidthLg
                        ? MediaQuery.of(context).size.width / 45
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? MediaQuery.of(context).size.width / 55
                            : MediaQuery.of(context).size.width <=
                                    vScreenWidthXl2
                                ? MediaQuery.of(context).size.width / 63
                                : MediaQuery.of(context).size.width / 73,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget dataCard(String iconImage, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color:
                Colors.grey.withOpacity(themeChange!.darkTheme ? 0.05 : 0.10),
            offset: const Offset(0, 10),
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: ListTile(
          leading: leading(iconImage),
          title: titleText(title),
          subtitle: subTitle(subtitle),
        ),
      ),
    );
  }

  Widget leading(String iconImage) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColor.iconBoxColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Image.asset(
          iconImage,
          // "${AppImage.internationHostingImage}safety.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget titleText(String title) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width <= vScreenWidthSm ? 0 : 10),
      child: AppText(
        text: title,
        style: widget.isTextstyleType,
        color: themeChange!.darkTheme
            ? AppColor.whiteColor
            : AppColor.bluetextColor,
        fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 30
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 50
                : MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? MediaQuery.of(context).size.width / 60
                    : MediaQuery.of(context).size.width <= vScreenWidthXl
                        ? MediaQuery.of(context).size.width / 75
                        : MediaQuery.of(context).size.width <= vScreenWidthXl2
                            ? MediaQuery.of(context).size.width / 88
                            : MediaQuery.of(context).size.width / 110,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget subTitle(String subtitle) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width <= vScreenWidthSm ? 0 : 10),
      child: AppText(
        text: subtitle,
        style: widget.isTextstyleType,
        color: themeChange!.darkTheme
            ? AppColor.whiteColor
            : AppColor.bluetextColor,
        fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 40
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 75
                : MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? MediaQuery.of(context).size.width / 90
                    : MediaQuery.of(context).size.width <= vScreenWidthXl
                        ? MediaQuery.of(context).size.width / 105
                        : MediaQuery.of(context).size.width <= vScreenWidthXl2
                            ? MediaQuery.of(context).size.width / 125
                            : MediaQuery.of(context).size.width / 150,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
