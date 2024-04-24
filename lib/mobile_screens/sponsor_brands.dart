import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:provider/provider.dart';

class SponsorListViewMob extends StatefulWidget {
  final String isTextstyleType;
  const SponsorListViewMob({super.key, required this.isTextstyleType});

  @override
  State<SponsorListViewMob> createState() => _SponsorListViewMobState();
}

class _SponsorListViewMobState extends State<SponsorListViewMob> {
  DarkThemeProvider? themeChange;
  ScrollController listScrollController = ScrollController();
  final CarouselController _controller = CarouselController();
  late int _current = 0;

  List brandsImage = [
    {'image': "${AppImage.brandsImage}shutterstock.png"},
    {'image': "${AppImage.brandsImage}cnn.png"},
    {'image': "${AppImage.brandsImage}forbes.png"},
    {'image': "${AppImage.brandsImage}spotify.png"},
    {'image': "${AppImage.brandsImage}ubisoft.png"},
  ];

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      children: [
        Container(
          height:
              MediaQuery.of(context).size.width <= vScreenWidthMd ? 220 : 242,
          width: double.infinity,
          decoration: BoxDecoration(
              color: themeChange!.darkTheme
                  ? AppColor.sponsorBackGroundColor.withOpacity(0.1)
                  : AppColor.sponsorBackGroundColor),
          child: Padding(
            padding: EdgeInsets.only(
                // left: MediaQuery.of(context).size.width <= vScreenWidthMd
                //     ? vDefaultPadding - 10
                //     : vDefaultPadding * 1.5,
                // right: MediaQuery.of(context).size.width <= vScreenWidthMd
                //     ? vDefaultPadding - 10
                //     : vDefaultPadding * 1.5,
                // top: vDefaultPadding * 1.5,
                bottom: MediaQuery.of(context).size.width <= vScreenWidthMd
                    ? 0
                    : vDefaultPadding * 1.5),
            child: Center(
              child: MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? carlous()
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        brandsListView(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: vDefaultPadding),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [leftButton(), rightButton()],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ],
    );
  }

  Widget leftButton() {
    return GestureDetector(
      onTap: () {
        if (listScrollController.hasClients) {
          final position = listScrollController.offset - 310.0;
          listScrollController.animateTo(
            position,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      },
      child: Container(
        height: 60, //48,
        width: 60, //48,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(themeChange!.darkTheme ? 0.1 : 0.50),
              offset: const Offset(0, 2),
              blurRadius: 1,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(vDefaultPadding * 1.5),
          child: Image.asset(
            "${AppImage.brandsImage}left.png",
            color: themeChange!.darkTheme
                ? AppColor.whiteColor.withOpacity(0.9)
                : null,
          ),
        ),
      ),
    );
  }

  Widget brandsListView() {
    return Padding(
      padding: const EdgeInsets.only(
          left: vTextPadding + 1,
          right: vTextPadding + 1,
          top: vDefaultPadding * 2,
          bottom: vDefaultPadding),
      child: ScrollConfiguration(
          // height: MediaQuery.of(context).size.height / 8,
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: listScrollController,
            child: Row(
              children: [
                const SizedBox(width: 80),
                imageBox("${AppImage.brandsImage}shutterstock.png"),
                imageBox("${AppImage.brandsImage}cnn.png"),
                imageBox("${AppImage.brandsImage}forbes.png"),
                imageBox("${AppImage.brandsImage}spotify.png"),
                imageBox("${AppImage.brandsImage}ubisoft.png"),
                imageBox("${AppImage.brandsImage}shutterstock.png"),
                imageBox("${AppImage.brandsImage}cnn.png"),
                imageBox("${AppImage.brandsImage}forbes.png"),
                imageBox("${AppImage.brandsImage}spotify.png"),
                imageBox("${AppImage.brandsImage}ubisoft.png"),
                const SizedBox(width: 80),
              ],
            ),
          )),
    );
  }

  Widget imageBox(String imagePath) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 40, vertical: vDefaultPadding),
      child: Container(
        // height: 136,
        width: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? 221
            : MediaQuery.of(context).size.width <= vScreenWidthMd ||
                    MediaQuery.of(context).size.width <= vScreenWidthXl
                ? 190
                : 271,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
                color: themeChange!.darkTheme
                    ? AppColor.whiteColor.withOpacity(0.9)
                    : AppColor.sponsorBoxColor),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Image.asset(
            imagePath,
            color: themeChange!.darkTheme
                ? AppColor.whiteColor.withOpacity(0.9)
                : null,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget rightButton() {
    return GestureDetector(
      onTap: () {
        if (listScrollController.hasClients) {
          final position = listScrollController.offset + 310.0;
          listScrollController.animateTo(
            position,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
        }
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.grey.withOpacity(themeChange!.darkTheme ? 0.1 : 0.50),
              offset: const Offset(0, 2),
              blurRadius: 1,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(vDefaultPadding * 1.5),
          child: Image.asset(
            "${AppImage.brandsImage}right.png",
            color: themeChange!.darkTheme
                ? AppColor.whiteColor.withOpacity(0.9)
                : null,
          ),
        ),
      ),
    );
  }

  Widget carlous() {
    return Column(
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: CarouselSlider(
              items: brandsImage
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width <=
                                  vScreenWidthMd
                              ? 8
                              : 10,
                          vertical: vDefaultPadding),
                      child: Container(
                        width: 240,
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(
                                color: themeChange!.darkTheme
                                    ? AppColor.whiteColor.withOpacity(0.9)
                                    : AppColor.sponsorBoxColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 18),
                          child: Image.asset(
                            e['image'],
                            fit: BoxFit.fill,
                            color: themeChange!.darkTheme
                                ? AppColor.whiteColor.withOpacity(0.9)
                                : null,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
                enlargeCenterPage: false,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction:
                    MediaQuery.of(context).size.width <= vScreenWidthSm
                        ? 0.68
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? 0.45
                            : 0.5,
              )),
        ),
        sizeBoxHeight(vDefaultPadding - 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: brandsImage.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? AppColor.ledingColor
                            : AppColor.ledingColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
