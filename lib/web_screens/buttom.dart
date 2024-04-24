// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/utils/app_textstyle.dart';
import 'package:hoster/widgets/app_button.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Buttom extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const Buttom(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<Buttom> createState() => _ButtomState();
}

class _ButtomState extends State<Buttom> {
  DarkThemeProvider? themeChange;

  void _openMap() async {
    const url =
        "https://www.google.com/maps/place/21+King+St,+Melbourne+VIC+3000,+Australia/@-37.817094,144.9497454,3102m/data=!3m1!1e3!4m6!3m5!1s0x6ad65d52754eaecb:0x22f367daf52cbd47!8m2!3d-37.819936!4d144.9570765!16s%2Fg%2F11c2dj2n2c?entry=ttu";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _sendEmail() async {
    const url =
        'https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox?compose=new';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _makePhoneCall() async {
    const url = 'tel:${150 - 250 - 6969}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Container(
      // height: MediaQuery.of(context).size.width <= vScreenWidthSm
      //     ? MediaQuery.of(context).size.height / 1.4
      //     : MediaQuery.of(context).size.width <= vScreenWidthMd
      //         ? MediaQuery.of(context).size.height / 1.4
      //         : MediaQuery.of(context).size.width <= vScreenWidthXl
      //             ? MediaQuery.of(context).size.height / 2.7
      //             : MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.buttomBackGround,
      ),
      child: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 15,
                  vertical: MediaQuery.of(context).size.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  hader(),
                  sizeBoxHeight(vDefaultPadding * 2),
                  newsletter(),
                  sizeBoxHeight(vDefaultPadding * 2),
                  contractUs(),
                  sizeBoxHeight(vDefaultPadding * 2),
                  quickLinks(),
                  sizeBoxHeight(vDefaultPadding * 2),
                  const Divider(),
                  sizeBoxHeight(vDefaultPadding),
                  socialMedia(),
                  sizeBoxHeight(vDefaultPadding),
                ],
              ),
            )
          : MediaQuery.of(context).size.width <= vScreenWidthMd
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 15,
                      vertical: MediaQuery.of(context).size.width / 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      hader(),
                      sizeBoxHeight(vDefaultPadding * 2),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          quickLinks(),
                          sizeBoxWidth(vDefaultPadding * 5),
                          contractUs()
                        ],
                      ),
                      sizeBoxHeight(vDefaultPadding * 2),
                      newsletter()
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          MediaQuery.of(context).size.width <= vScreenWidthXl
                              ? MediaQuery.of(context).size.height / 60
                              : MediaQuery.of(context).size.width / 7.5,
                      vertical:
                          MediaQuery.of(context).size.width <= vScreenWidthXl
                              ? MediaQuery.of(context).size.height / 23
                              : MediaQuery.of(context).size.height / 30),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        hader(),
                        quickLinks(),
                        contractUs(),
                        newsletter()
                      ],
                    ),
                  ),
                ),
    );
  }

  Widget hader() {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? CrossAxisAlignment.center
          : widget.isDirectionType == "righttoleft" ||
                  widget.isDirectionType == ""
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width <= vScreenWidthSm
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? MediaQuery.of(context).size.height / 5
                  : MediaQuery.of(context).size.width <= vScreenWidthXl
                      ? MediaQuery.of(context).size.width / 7
                      : MediaQuery.of(context).size.width <= vScreenWidthXl
                          ? MediaQuery.of(context).size.width / 8
                          : MediaQuery.of(context).size.width <= vScreenWidthXl2
                              ? MediaQuery.of(context).size.width / 9
                              : MediaQuery.of(context).size.width / 10,
          child: Image.asset(
            "${AppImage.dashboardImage}logo_darktheme.png",
          ),
        ),
        sizeBoxHeight(vDefaultPadding),
        SizedBox(
          width: MediaQuery.of(context).size.width <= vScreenWidthMd
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width / 6.5,
          child: AppText(
              text: Languages.of(context)!.thePointOf,
              style: widget.isTextstyleType,
              textDirection: widget.isDirectionType,
              color: AppColor.whiteColor,
              fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? 12
                  : MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? MediaQuery.of(context).size.width / 48
                      : MediaQuery.of(context).size.width <= vScreenWidthXl
                          ? MediaQuery.of(context).size.width / 75
                          : MediaQuery.of(context).size.width <= vScreenWidthXl1
                              ? MediaQuery.of(context).size.width / 90
                              : MediaQuery.of(context).size.width <=
                                      vScreenWidthXl2
                                  ? MediaQuery.of(context).size.width / 98
                                  : MediaQuery.of(context).size.width <=
                                          vScreenWidthXl3
                                      ? MediaQuery.of(context).size.width / 110
                                      : MediaQuery.of(context).size.width <=
                                              vScreenWidthXxl
                                          ? MediaQuery.of(context).size.width /
                                              110
                                          : MediaQuery.of(context).size.width /
                                              130,
              // fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
              //     ? MediaQuery.of(context).size.width / 30
              //     : MediaQuery.of(context).size.width <= vScreenWidthLg
              //         ? MediaQuery.of(context).size.width / 48
              //         : MediaQuery.of(context).size.width <= vScreenWidthXl
              //             ? MediaQuery.of(context).size.width / 75
              //             : MediaQuery.of(context).size.width <= vScreenWidthXl1
              //                 ? MediaQuery.of(context).size.width / 80
              //                 : MediaQuery.of(context).size.width <=
              //                         vScreenWidthXl2
              //                     ? MediaQuery.of(context).size.width / 90
              //                     : MediaQuery.of(context).size.width <=
              //                             vScreenWidthXl3
              //                         ? MediaQuery.of(context).size.width / 115
              //                         : MediaQuery.of(context).size.width <=
              //                                 vScreenWidthXxl
              //                             ? MediaQuery.of(context).size.width /
              //                                 110
              //                             : MediaQuery.of(context).size.width /
              //                                 130,
              fontWeight: FontWeight.normal),
        ),
        Visibility(
          visible: MediaQuery.of(context).size.width > vScreenWidthSm,
          child: Column(
            children: [
              sizeBoxHeight(vDefaultPadding),
              socialMedia(),
            ],
          ),
        )
      ],
    );
  }

  Widget socialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SocialMediaCard(imagePath: "${AppImage.buttomImage}facebook.png"),
        sizeBoxWidth(10),
        SocialMediaCard(imagePath: "${AppImage.buttomImage}instagram.png"),
        sizeBoxWidth(10),
        SocialMediaCard(imagePath: "${AppImage.buttomImage}youtube.png"),
        sizeBoxWidth(10),
        SocialMediaCard(imagePath: "${AppImage.buttomImage}linkedin.png"),
        sizeBoxWidth(10),
        SocialMediaCard(imagePath: "${AppImage.buttomImage}twitter.png"),
      ],
    );
  }

  Widget quickLinks() {
    return SizedBox(
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width
          : 130,
      child: Column(
        crossAxisAlignment: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? CrossAxisAlignment.center
            : widget.isDirectionType == "righttoleft" ||
                    widget.isDirectionType == ""
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headerText(Languages.of(context)!.quickLinks),
          //
          sizeBoxHeight(MediaQuery.of(context).size.width <= vScreenWidthMd
              ? vDefaultPadding * 0.5
              : vDefaultPadding * 0.8),
          //
          SizedBox(
              height: 4,
              width: 40,
              child: Image.asset("${AppImage.buttomImage}divider.png")),
          //
          sizeBoxHeight(MediaQuery.of(context).size.width <= vScreenWidthSm
              ? vDefaultPadding * 0.8
              : MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? vDefaultPadding * 0.5
                  : vDefaultPadding * 0.8),
          //
          MediaQuery.of(context).size.width <= vScreenWidthSm
              ? Wrap(
                  alignment: WrapAlignment.center,
                  spacing: MediaQuery.of(context).size.width / 13,
                  runSpacing: vDefaultPadding,
                  children: [
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.home,
                        isDirectionType: widget.isDirectionType),
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.about,
                        isDirectionType: widget.isDirectionType),
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.property,
                        isDirectionType: widget.isDirectionType),
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.contact,
                        isDirectionType: widget.isDirectionType),
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.blogArticles,
                        isDirectionType: widget.isDirectionType),
                  ],
                )
              : Column(
                  crossAxisAlignment:
                      MediaQuery.of(context).size.width <= vScreenWidthSm
                          ? CrossAxisAlignment.center
                          : widget.isDirectionType == "righttoleft" ||
                                  widget.isDirectionType == ""
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                  children: [
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.home,
                        isDirectionType: widget.isDirectionType),
                    //
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthMd
                        ? vDefaultPadding * 0.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? vDefaultPadding * 0.8
                            : vDefaultPadding * 0.8),

                    //

                    QuickLinksSubTitle(
                        text: Languages.of(context)!.about,
                        isDirectionType: widget.isDirectionType),
                    //
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthMd
                        ? vDefaultPadding * 0.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? vDefaultPadding * 0.8
                            : vDefaultPadding * 0.8),
                    //

                    QuickLinksSubTitle(
                        text: Languages.of(context)!.property,
                        isDirectionType: widget.isDirectionType),
                    //
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthMd
                        ? vDefaultPadding * 0.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? vDefaultPadding * 0.8
                            : vDefaultPadding * 0.8),
                    //

                    QuickLinksSubTitle(
                        text: Languages.of(context)!.contact,
                        isDirectionType: widget.isDirectionType),
                    //
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthMd
                        ? vDefaultPadding * 0.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? vDefaultPadding * 0.8
                            : vDefaultPadding * 0.8),
                    //
                    QuickLinksSubTitle(
                        text: Languages.of(context)!.blogArticles,
                        isDirectionType: widget.isDirectionType),
                  ],
                )
        ],
      ),
    );
  }

  Widget contractUs() {
    return SizedBox(
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width
          : 280,
      child: Column(
        crossAxisAlignment: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? CrossAxisAlignment.center
            : widget.isDirectionType == "righttoleft" ||
                    widget.isDirectionType == ""
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headerText(Languages.of(context)!.contactUs),
          //
          sizeBoxHeight(MediaQuery.of(context).size.width <= vScreenWidthSm
              ? vDefaultPadding * 0.5
              : MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? vDefaultPadding * 0.5
                  : MediaQuery.of(context).size.width <= vScreenWidthXl
                      ? vDefaultPadding * 0.8
                      : vDefaultPadding * 0.8),
          //
          SizedBox(
              height: 4,
              width: 40,
              child: Image.asset("${AppImage.buttomImage}divider.png")),
          //
          sizeBoxHeight(MediaQuery.of(context).size.width <= vScreenWidthSm
              ? vDefaultPadding * 0.8
              : MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? vDefaultPadding * 0.5
                  : MediaQuery.of(context).size.width <= vScreenWidthXl
                      ? vDefaultPadding * 0.8
                      : vDefaultPadding * 0.8),

          MediaQuery.of(context).size.width <= vScreenWidthSm
              ? Wrap(
                  alignment: WrapAlignment.center,
                  runSpacing: vDefaultPadding,
                  spacing: vDefaultPadding,
                  children: [
                    ContactUsSubs(
                      iconImagePath: "${AppImage.buttomImage}location.png",
                      text: Languages.of(context)!.location,
                      isDirectionType: widget.isDirectionType,
                      onTap: () {
                        _openMap();
                      },
                    ),
                    ContactUsSubs(
                      iconImagePath: "${AppImage.buttomImage}call.png",
                      text: "+1 (500) 250-6969",
                      isDirectionType: widget.isDirectionType,
                      onTap: () {
                        _makePhoneCall();
                      },
                    ),
                    ContactUsSubs(
                      iconImagePath: "${AppImage.buttomImage}mail.png",
                      text: "Admin.example@urmail.net",
                      isDirectionType: widget.isDirectionType,
                      onTap: () {
                        _sendEmail();
                      },
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment:
                      MediaQuery.of(context).size.width <= vScreenWidthSm
                          ? CrossAxisAlignment.center
                          : widget.isDirectionType == "righttoleft" ||
                                  widget.isDirectionType == ""
                              ? CrossAxisAlignment.start
                              : CrossAxisAlignment.end,
                  children: [
                    ContactUsSubs(
                      iconImagePath: "${AppImage.buttomImage}location.png",
                      text: Languages.of(context)!.location,
                      isDirectionType: widget.isDirectionType,
                      onTap: () {
                        _openMap();
                      },
                    ),
                    //
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthMd
                        ? vDefaultPadding * 0.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? vDefaultPadding * 0.8
                            : vDefaultPadding * 0.8),
                    //
                    ContactUsSubs(
                      iconImagePath: "${AppImage.buttomImage}call.png",
                      text: "+1 (500) 250-6969",
                      isDirectionType: widget.isDirectionType,
                      onTap: () {
                        _makePhoneCall();
                      },
                    ),
                    //
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthMd
                        ? vDefaultPadding * 0.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl
                            ? vDefaultPadding * 0.8
                            : vDefaultPadding * 0.8),
                    //
                    ContactUsSubs(
                      iconImagePath: "${AppImage.buttomImage}mail.png",
                      text: "Admin.example@urmail.net",
                      isDirectionType: widget.isDirectionType,
                      onTap: () {
                        _sendEmail();
                      },
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget newsletter() {
    return Column(
      crossAxisAlignment: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? CrossAxisAlignment.center
          : widget.isDirectionType == "righttoleft" ||
                  widget.isDirectionType == ""
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.end,
      children: [
        headerText(Languages.of(context)!.newsletter),
        //
        sizeBoxHeight(MediaQuery.of(context).size.width <= vScreenWidthSm
            ? vDefaultPadding * 0.5
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? vDefaultPadding * 0.5
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? vDefaultPadding * 0.8
                    : vDefaultPadding * 0.8),
        //
        SizedBox(
            height: 4,
            width: 40,
            child: Image.asset("${AppImage.buttomImage}divider.png")),
        //
        sizeBoxHeight(MediaQuery.of(context).size.width <= vScreenWidthSm
            ? vDefaultPadding * 0.8
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? vDefaultPadding * 0.5
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? vDefaultPadding * 0.8
                    : vDefaultPadding * 0.8),
        //
        MediaQuery.of(context).size.width <= vScreenWidthMd &&
                MediaQuery.of(context).size.width > vScreenWidthSm
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textfield(),
                  sizeBoxWidth(vDefaultPadding * 1),
                  button(),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textfield(),
                  sizeBoxHeight(
                      MediaQuery.of(context).size.height <= vScreenWidthSm
                          ? vDefaultPadding * 1
                          : MediaQuery.of(context).size.height <= vScreenWidthMd
                              ? vDefaultPadding * 1
                              : vDefaultPadding * 1),
                  button(),
                ],
              )
      ],
    );
  }

  Widget textfield() {
    return SizedBox(
      height: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? 45
          : MediaQuery.of(context).size.height / 25,
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 1.3
          : MediaQuery.of(context).size.width <= vScreenWidthMd
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width / 8,
      child: Center(
        child: TextFormField(
          cursorColor: AppColor.buttonColor,
          cursorHeight: vDefaultPadding - 1,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 7, right: 10),
              filled: true,
              fillColor: const Color(0xffEDF4FF),
              prefixIcon: const Icon(
                Icons.mail_outline_rounded,
                size: 20,
                color: Color(0xff9D9EB3),
              ),
              hintText: Languages.of(context)!.email,
              hintStyle: textStyle(widget.isTextstyleType, FontWeight.normal,
                  13, AppColor.blackColor),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: AppColor.whiteColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide(color: AppColor.whiteColor))),
        ),
      ),
    );
  }

  Widget button() {
    return AppButton(
        height: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? 45
            : MediaQuery.of(context).size.height / 25,
        width: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 3
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 7
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? MediaQuery.of(context).size.width / 9
                    : MediaQuery.of(context).size.width / 12,
        text: Languages.of(context)!.subscribe,
        style: widget.isTextstyleType,
        textcolor: AppColor.whiteColor,
        textSize: 14,
        textWeight: FontWeight.bold,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 6);
  }

  Widget headerText(String title) {
    return AppText(
      text: title,
      style: widget.isTextstyleType,
      textDirection: widget.isDirectionType,
      color: AppColor.whiteColor,
      fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 20
          : MediaQuery.of(context).size.width <= vScreenWidthMd
              ? MediaQuery.of(context).size.width / 40
              : MediaQuery.of(context).size.width <= vScreenWidthXl
                  ? MediaQuery.of(context).size.width / 60
                  : MediaQuery.of(context).size.width <= vScreenWidthXl1
                      ? MediaQuery.of(context).size.width / 70
                      : MediaQuery.of(context).size.width <= vScreenWidthXl2
                          ? MediaQuery.of(context).size.width / 85
                          : MediaQuery.of(context).size.width <= vScreenWidthXl3
                              ? MediaQuery.of(context).size.width / 80
                              : MediaQuery.of(context).size.width <=
                                      vScreenWidthXxl
                                  ? MediaQuery.of(context).size.width / 85
                                  : MediaQuery.of(context).size.width / 100,
      fontWeight: FontWeight.bold,
    );
  }
}

class SocialMediaCard extends StatefulWidget {
  final String imagePath;
  const SocialMediaCard({super.key, required this.imagePath});

  @override
  State<SocialMediaCard> createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
  bool isHovering = false;

  _mouseHover(bool hovering) {
    setState(() {
      isHovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _mouseHover(true),
      onExit: (event) => _mouseHover(false),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: !isHovering
            ? SizedBox(
                key: UniqueKey(),
                child: Image.asset(widget.imagePath,
                    height: 35, color: AppColor.whiteColor))
            : Container(
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(100)),
                key: UniqueKey(),
                child: Image.asset(widget.imagePath,
                    height: 35, color: AppColor.ledingColor),
              ),
      ),
    );
  }
}

class QuickLinksSubTitle extends StatefulWidget {
  final String text;
  final String isDirectionType;
  const QuickLinksSubTitle(
      {super.key, required this.text, required this.isDirectionType});

  @override
  State<QuickLinksSubTitle> createState() => _QuickLinksSubTitleState();
}

class _QuickLinksSubTitleState extends State<QuickLinksSubTitle> {
  bool isHovering = false;

  _mouseHover(bool hovering) {
    setState(() {
      isHovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _mouseHover(true),
      onExit: (event) => _mouseHover(false),
      cursor: SystemMouseCursors.click,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 100),
        child: !isHovering
            ? Row(
                mainAxisSize: MainAxisSize.min,
                key: UniqueKey(),
                children: [
                  Visibility(
                    visible: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == "",
                    child: Row(
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image.asset(
                              "${AppImage.buttomImage}desc_point.png"),
                        ),
                        sizeBoxWidth(vDefaultPadding)
                      ],
                    ),
                  ),
                  AppText(
                      text: widget.text,
                      textDirection: widget.isDirectionType,
                      fontsize: 15,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w400),
                  Visibility(
                    visible: widget.isDirectionType == "lefttoright",
                    child: Row(
                      children: [
                        sizeBoxWidth(vDefaultPadding),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image.asset(
                              "${AppImage.buttomImage}desc_point.png"),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                key: UniqueKey(),
                children: [
                  Visibility(
                    visible: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == "",
                    child: Row(
                      children: [
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child:
                              Image.asset("${AppImage.buttomImage}point.png"),
                        ),
                        sizeBoxWidth(vDefaultPadding)
                      ],
                    ),
                  ),
                  AppText(
                      text: widget.text,
                      textDirection: widget.isDirectionType,
                      fontsize: 15,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w400),
                  Visibility(
                    visible: widget.isDirectionType == "lefttoright",
                    child: Row(
                      children: [
                        sizeBoxWidth(vDefaultPadding),
                        Container(
                          height: 6,
                          width: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child:
                              Image.asset("${AppImage.buttomImage}point.png"),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class ContactUsSubs extends StatefulWidget {
  final String iconImagePath;
  final String text;
  final String isDirectionType;
  final void Function() onTap;
  const ContactUsSubs(
      {super.key,
      required this.iconImagePath,
      required this.text,
      required this.onTap,
      required this.isDirectionType});

  @override
  State<ContactUsSubs> createState() => _ContactUsSubStates();
}

class _ContactUsSubStates extends State<ContactUsSubs> {
  bool isHovering = false;

  _mouseHover(bool hovering) {
    setState(() {
      isHovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => _mouseHover(true),
        onExit: (event) => _mouseHover(false),
        cursor: SystemMouseCursors.click,
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: !isHovering
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    key: UniqueKey(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: widget.isDirectionType == "righttoleft" ||
                            widget.isDirectionType == "",
                        child: Row(
                          children: [
                            Image.asset(widget.iconImagePath,
                                height: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18,
                                width: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18),
                            sizeBoxWidth(vDefaultPadding),
                          ],
                        ),
                      ),
                      AppText(
                          text: widget.text,
                          textDirection: widget.isDirectionType,
                          fontsize: 15,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w400),
                      Visibility(
                        visible: widget.isDirectionType == "lefttoright",
                        child: Row(
                          children: [
                            sizeBoxWidth(vDefaultPadding),
                            Image.asset(widget.iconImagePath,
                                height: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18,
                                width: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18),
                          ],
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    key: UniqueKey(),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: widget.isDirectionType == "righttoleft" ||
                            widget.isDirectionType == "",
                        child: Row(
                          children: [
                            Image.asset(widget.iconImagePath,
                                height: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18,
                                width: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18),
                            sizeBoxWidth(vDefaultPadding),
                          ],
                        ),
                      ),
                      AppText(
                          text: widget.text,
                          textDirection: widget.isDirectionType,
                          fontsize: 15,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w500),
                      Visibility(
                        visible: widget.isDirectionType == "lefttoright",
                        child: Row(
                          children: [
                            sizeBoxWidth(vDefaultPadding),
                            Image.asset(widget.iconImagePath,
                                height: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18,
                                width: MediaQuery.of(context).size.width <=
                                        vScreenWidthSm
                                    ? 15
                                    : 18),
                          ],
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
