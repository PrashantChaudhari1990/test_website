import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/utils/app_textstyle.dart';
import 'package:hoster/utils/keys.dart';
import 'package:hoster/widgets/app_button.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class OurExclusiveMob extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const OurExclusiveMob(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<OurExclusiveMob> createState() => _OurExclusiveMob();
}

class _OurExclusiveMob extends State<OurExclusiveMob> {
  DarkThemeProvider? themeChange;
  // final CarouselController _controller = CarouselController();
  // late int _current = 0;

  @override
  Widget build(BuildContext context) {
    List dataList = [
      {
        'image': '${AppImage.ourexclusiveImage}image1.png',
        'name': Languages.of(context)!.ehsan,
        'catogari': Languages.of(context)!.markStreet,
        'phone': "880 123 4567",
      },
      {
        'image': '${AppImage.ourexclusiveImage}image2.png',
        'name': Languages.of(context)!.yasaman,
        'catogari': Languages.of(context)!.ecoBuilder,
        'phone': "880 123 4567",
      },
      {
        'image': '${AppImage.ourexclusiveImage}image3.png',
        'name': Languages.of(context)!.taravat,
        'catogari': Languages.of(context)!.sweetHome,
        'phone': "880 123 4567",
      }
    ];
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            sizeBoxHeight(60),
            Stack(
              children: [
                MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? MediaQuery.of(context).size.height / 7
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthLg
                                        ? MediaQuery.of(context).size.height / 6
                                        : MediaQuery.of(context).size.width <=
                                                vScreenWidthXl
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                3
                                            : MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2),
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Image.asset(
                                  "${AppImage.ourexclusiveImage}vector1.png",
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ],
                      ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width <= vScreenWidthSm
                              ? 0
                              : vDefaultPadding,
                      vertical: 28),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        title(),
                        sizeBoxHeight(
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 1
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthMd
                                    ? vDefaultPadding * 1.1
                                    : vDefaultPadding * 2),
                        discription(),
                        sizeBoxHeight(
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 3
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthLg
                                    ? vDefaultPadding * 2
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthMd
                                        ? vDefaultPadding * 1.1
                                        : vDefaultPadding * 4),
                        // MediaQuery.of(context).size.width <= vScreenWidthLg
                        //     ? carousel()
                        //     : agents(),
                        agents(dataList),
                        SizedBox(key: emailKey),
                        sizeBoxHeight(
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 5
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthLg
                                    ? vDefaultPadding * 2
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthMd
                                        ? vDefaultPadding * 1.1
                                        : vDefaultPadding * 4),
                        subscribe(),
                        sizeBoxHeight(vDefaultPadding * 2)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return AppText(
      text: Languages.of(context)!.ourExclusiveTitle,
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

  Widget discription() {
    return AppText(
      text: Languages.of(context)!.ourExclusiveDiscription,
      style: widget.isTextstyleType,
      textCenter: true,
      fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 30
          : MediaQuery.of(context).size.width <= vScreenWidthLg
              ? 12
              : MediaQuery.of(context).size.width <= vScreenWidthXl ||
                      MediaQuery.of(context).size.width <= vScreenWidthXl1 ||
                      MediaQuery.of(context).size.width <= vScreenWidthXl2 ||
                      MediaQuery.of(context).size.width <= vScreenWidthXl3
                  ? MediaQuery.of(context).size.width / 85
                  : MediaQuery.of(context).size.width / 100,
    );
  }

  Widget agents(List dataList) {
    return Wrap(
        children: dataList
            .map(
              (e) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Container(
                  height: 350,
                  width: 252,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: AppColor.textColor.withOpacity(0.10))),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 120,
                          width: 135,
                          child: Image.asset(e['image']),
                        ),
                        sizeBoxHeight(vDefaultPadding * 1.8),
                        AppText(
                            text: e['name'],
                            style: widget.isTextstyleType,
                            fontWeight: FontWeight.w600,
                            fontsize: 18),
                        AppText(
                            text: e['catogari'],
                            style: widget.isTextstyleType,
                            fontWeight: FontWeight.normal,
                            fontsize: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.asset(
                                  "${AppImage.ourexclusiveImage}call.png"),
                            ),
                            sizeBoxWidth(vDefaultPadding * 0.5),
                            AppText(
                                text:
                                    "${Languages.of(context)!.call}+${e['phone']}",
                                style: widget.isTextstyleType,
                                fontWeight: FontWeight.normal,
                                fontsize: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList());
  }
  // Widget carousel() {
  //   return Column(
  //     children: [
  //       CarouselSlider(
  //         items: dataList
  //             .map(
  //               (e) => Container(
  //                 height: 350,
  //                 width: 250,
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     color: AppColor.whiteColor,
  //                     border: Border.all(
  //                         color: AppColor.textColor.withOpacity(0.10))),
  //                 child: Padding(
  //                   padding: const EdgeInsets.symmetric(
  //                       horizontal: 20, vertical: 30),
  //                   child: Column(
  //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       SizedBox(
  //                         height: 120,
  //                         width: 135,
  //                         child: Image.asset(e['image']),
  //                       ),
  //                       sizeBoxHeight(vDefaultPadding * 1.8),
  //                       AppText(
  //                           text: e['name'],
  //                           color: AppColor.textColor,
  //                           fontWeight: FontWeight.w600,
  //                           fontsize: 18),
  //                       AppText(
  //                           text: e['catogari'],
  //                           color: AppColor.textColor,
  //                           fontWeight: FontWeight.normal,
  //                           fontsize: 15),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         children: [
  //                           SizedBox(
  //                             height: 30,
  //                             width: 30,
  //                             child: Image.asset(
  //                                 "${AppImage.ourexclusiveImage}call.png"),
  //                           ),
  //                           sizeBoxWidth(vDefaultPadding * 0.5),
  //                           AppText(
  //                               text: "Call: +${e['phone']}",
  //                               color: AppColor.textColor,
  //                               fontWeight: FontWeight.normal,
  //                               fontsize: 15),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             )
  //             .toList(),
  //         options: CarouselOptions(
  //           onPageChanged: (index, reason) {
  //             setState(() {
  //               _current = index;
  //             });
  //           },
  //           height: 360,
  //           enlargeCenterPage: true,
  //           enlargeFactor: 0.2,
  //           autoPlay: true,
  //           aspectRatio: 16 / 9,
  //           autoPlayCurve: Curves.fastOutSlowIn,
  //           enableInfiniteScroll: true,
  //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
  //           viewportFraction:
  //               MediaQuery.of(context).size.width <= vScreenWidthSm
  //                   ? 0.68
  //                   : MediaQuery.of(context).size.width <= vScreenWidthMd
  //                       ? 0.62
  //                       : MediaQuery.of(context).size.width <= vScreenWidthLg
  //                           ? 0.35
  //                           : 0.7,
  //         ),
  //       ),
  //       sizeBoxHeight(vDefaultPadding * 2),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: dataList.asMap().entries.map((entry) {
  //           return GestureDetector(
  //             onTap: () => _controller.animateToPage(entry.key),
  //             child: Container(
  //               width: 12.0,
  //               height: 12.0,
  //               margin:
  //                   const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
  //               decoration: BoxDecoration(
  //                   shape: BoxShape.circle,
  //                   color: (Theme.of(context).brightness == Brightness.dark
  //                           ? AppColor.ledingColor
  //                           : AppColor.ledingColor)
  //                       .withOpacity(_current == entry.key ? 0.9 : 0.4)),
  //             ),
  //           );
  //         }).toList(),
  //       ),
  //     ],
  //   );
  // }

  Widget subscribe() {
    return Container(
      height: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 3
          : MediaQuery.of(context).size.width <= vScreenWidthMd
              ? MediaQuery.of(context).size.width / 5
              : MediaQuery.of(context).size.width <= vScreenWidthXl
                  ? MediaQuery.of(context).size.width / 5
                  : MediaQuery.of(context).size.height / 3.5,
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width <= vScreenWidthXl
              ? MediaQuery.of(context).size.width / 1.3
              : MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width <= vScreenWidthSm ? 0 : 25),
          image: DecorationImage(
              image: AssetImage("${AppImage.ourexclusiveImage}background.png"),
              fit: BoxFit.fill)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width <= vScreenWidthMd
                ? 30
                : MediaQuery.of(context).size.width <= vScreenWidthMd
                    ? 50
                    : 100,
            vertical: 20),
        child: Center(
          child: MediaQuery.of(context).size.width <= vScreenWidthSm
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(),
                    sizeBoxHeight(vDefaultPadding),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textfield(),
                        sizeBoxWidth(
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 0.5
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthMd
                                    ? vDefaultPadding * 0.5
                                    : vDefaultPadding * 0.5),
                        button()
                      ],
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    text(),
                    Row(
                      children: [
                        textfield(),
                        sizeBoxWidth(
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 0.5
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthMd
                                    ? vDefaultPadding * 0.5
                                    : vDefaultPadding * 0.5),
                        button()
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget text() {
    return Expanded(
      child: AppText(
        text: Languages.of(context)!.subToNewsletter,
        style: widget.isTextstyleType,
        color: AppColor.whiteColor,
        fontWeight: FontWeight.w700,
        fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 25
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 40
                : MediaQuery.of(context).size.width / 45,
      ),
    );
  }

  Widget textfield() {
    return SizedBox(
      height: MediaQuery.of(context).size.height <= vScreenWidthSm
          ? MediaQuery.of(context).size.height / 20
          : MediaQuery.of(context).size.height / 19,
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width / 5.5,
      child: Center(
        child: TextFormField(
          cursorColor: AppColor.buttonColor,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              filled: true,
              fillColor: AppColor.whiteColor,
              hintText: Languages.of(context)!.yourEmail,
              hintStyle: textStyle(
                  widget.isTextstyleType,
                  FontWeight.normal,
                  MediaQuery.of(context).size.width <= vScreenWidthSm ? 10 : 13,
                  AppColor.blackColor
                  // fontSize: MediaQuery.of(context).size.width <= vScreenWidthSm
                  //     ? MediaQuery.of(context).size.width / 50
                  //     : MediaQuery.of(context).size.width <= vScreenWidthLg
                  //         ? MediaQuery.of(context).size.width / 60
                  //         : MediaQuery.of(context).size.width <= vScreenWidthXl
                  //             ? MediaQuery.of(context).size.width / 80
                  //             : MediaQuery.of(context).size.width / 120
                  ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.whiteColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColor.whiteColor))),
        ),
      ),
    );
  }

  Widget button() {
    return AppButton(
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 5
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 7
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? MediaQuery.of(context).size.width / 9
                    : MediaQuery.of(context).size.width / 12,
        text: Languages.of(context)!.subscribe,
        style: widget.isTextstyleType,
        textcolor: AppColor.whiteColor,
        textSize: MediaQuery.of(context).size.width <= vScreenWidthSm ? 10 : 13,
        textWeight: FontWeight.bold,
        buttoncolor: AppColor.subscribeButtonColor,
        onPressed: () {},
        borderRadius: 10);
  }
}
