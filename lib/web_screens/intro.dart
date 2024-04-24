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

class IntroScreen extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const IntroScreen(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  DarkThemeProvider? themeChange;

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);

    return Column(
      key: introKey,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "${AppImage.dashboardImage}${themeChange!.darkTheme ? "bg_darktheme.png" : "background.jpg"}"),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                ledingText(),
              ],
            ),
          ),
        ),
        Visibility(
            visible: MediaQuery.of(context).size.width <= vScreenWidthSm,
            child: personImage()),
        sizeBoxHeight(30)
      ],
    );
  }

  Widget ledingText() {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 15,
          right: MediaQuery.of(context).size.width / 21,
          bottom: MediaQuery.of(context).size.width / 33,
          top: MediaQuery.of(context).size.width / 33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width <= vScreenWidthSm
                        ? MediaQuery.of(context).size.width / 1.3
                        : MediaQuery.of(context).size.width <= vScreenWidthLg
                            ? MediaQuery.of(context).size.width / 2.3
                            : MediaQuery.of(context).size.width / 2.5,
                    child: RichText(
                        textAlign: widget.isDirectionType == "lefttoright"
                            ? TextAlign.right
                            : TextAlign.left,
                        text: TextSpan(children: [
                          TextSpan(
                              text:
                                  "${Languages.of(context)!.webHosting}\n${Languages.of(context)!.for_} ",
                              style: textStyle(
                                  widget.isTextstyleType,
                                  FontWeight.bold,
                                  MediaQuery.of(context).size.width <=
                                          vScreenWidthSm
                                      ? MediaQuery.of(context).size.width / 15
                                      : MediaQuery.of(context).size.width / 25,
                                  themeChange!.darkTheme
                                      ? AppColor.whiteColor
                                      : AppColor.textColor)),
                          TextSpan(
                              text: Languages.of(context)!.yourBusiness,
                              style: textStyle(
                                  widget.isTextstyleType,
                                  FontWeight.bold,
                                  MediaQuery.of(context).size.width <=
                                          vScreenWidthSm
                                      ? MediaQuery.of(context).size.width / 15
                                      : MediaQuery.of(context).size.width / 25,
                                  AppColor.ledingColor))
                        ])),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width <= vScreenWidthSm
                        ? MediaQuery.of(context).size.width / 1.3
                        : MediaQuery.of(context).size.width <= vScreenWidthLg
                            ? MediaQuery.of(context).size.width / 2.3
                            : MediaQuery.of(context).size.width / 2.5,
                    child: AppText(
                        text: Languages.of(context)!.homeDiscrtipton,
                        color: themeChange!.darkTheme
                            ? AppColor.whiteColor
                            : AppColor.textColor,
                        style: widget.isTextstyleType,
                        textDirection: widget.isDirectionType,
                        fontsize:
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? MediaQuery.of(context).size.width / 50
                                : MediaQuery.of(context).size.width / 95,
                        fontWeight: FontWeight.normal),
                  ),
                  sizeBoxHeight(MediaQuery.of(context).size.width <=
                              vScreenWidthSm ||
                          MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? vDefaultPadding * 2
                      : MediaQuery.of(context).size.width <= vScreenWidthLg
                          ? vDefaultPadding * 3
                          : vDefaultPadding * 8),
                  widget.isDirectionType == "righttoleft" ||
                          widget.isDirectionType == ""
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            sizeBoxWidth(
                              MediaQuery.of(context).size.width <=
                                      vScreenWidthSm
                                  ? vDefaultPadding * 2
                                  : MediaQuery.of(context).size.width <=
                                          vScreenWidthLg
                                      ? vDefaultPadding * 2.7
                                      : MediaQuery.of(context).size.width <=
                                              vScreenWidthMd
                                          ? vDefaultPadding * 2.5
                                          : vDefaultPadding * 6,
                            ),
                            button()
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            button(),
                            sizeBoxWidth(
                              MediaQuery.of(context).size.width <=
                                      vScreenWidthSm
                                  ? vDefaultPadding * 6
                                  : MediaQuery.of(context).size.width <=
                                          vScreenWidthLg
                                      ? vDefaultPadding * 6.7
                                      : MediaQuery.of(context).size.width <=
                                              vScreenWidthMd
                                          ? vDefaultPadding * 6.5
                                          : vDefaultPadding * 10,
                            ),
                          ],
                        )
                ],
              ),
            ),
          ),
          Visibility(
              visible: MediaQuery.of(context).size.width > vScreenWidthSm,
              child: personImage())
        ],
      ),
    );
  }

  Widget button() {
    return AppButton(
        // height: MediaQuery.of(context).size.width <=
        //         vScreenWidthSm
        //     ? MediaQuery.of(context).size.width / 13
        //     : MediaQuery.of(context).size.width <=
        //             vScreenWidthLg
        //         ? MediaQuery.of(context).size.height / 25
        //         : MediaQuery.of(context).size.width <=
        //                 vScreenWidthMd
        //             ? MediaQuery.of(context).size.height / 50
        //             : MediaQuery.of(context).size.width <=
        //                     vScreenWidthXl
        //                 ? MediaQuery.of(context).size.height /
        //                     23
        //                 : MediaQuery.of(context).size.height /
        //                     20,
        // width: MediaQuery.of(context).size.width <=
        //         vScreenWidthSm
        //     ? MediaQuery.of(context).size.width / 3
        //     : MediaQuery.of(context).size.width <=
        //             vScreenWidthLg
        //         ? MediaQuery.of(context).size.width / 6
        //         : MediaQuery.of(context).size.width <=
        //                 vScreenWidthXl
        //             ? MediaQuery.of(context).size.width / 6.5
        //             : MediaQuery.of(context).size.width <=
        //                     vScreenWidthXl1
        //                 ? MediaQuery.of(context).size.width /
        //                     8
        //                 : MediaQuery.of(context).size.width /
        //                     8.5,
        contentPadding: const EdgeInsets.symmetric(
            horizontal: vDefaultPadding * 2, vertical: vTextPadding * 2.3),
        text: Languages.of(context)!.startNow,
        textcolor: AppColor.whiteColor,
        textSize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 35
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 60
                : MediaQuery.of(context).size.width <= vScreenWidthXl1
                    ? MediaQuery.of(context).size.width / 70
                    : MediaQuery.of(context).size.width / 90,
        textWeight: FontWeight.bold,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 30);
  }

  Widget personImage() {
    return SizedBox(
        height: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 1.15
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 2.5
                : MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? MediaQuery.of(context).size.width / 2.7
                    : MediaQuery.of(context).size.width <= vScreenWidthXl1
                        ? MediaQuery.of(context).size.width / 2.8
                        : MediaQuery.of(context).size.width <= vScreenWidthXl3
                            ? MediaQuery.of(context).size.width / 2.6
                            : MediaQuery.of(context).size.width <=
                                    vScreenWidthXxl
                                ? MediaQuery.of(context).size.width / 2.5
                                : MediaQuery.of(context).size.width / 2.5,
        width: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 1.15
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 2.5
                : MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? MediaQuery.of(context).size.width / 2.6
                    : MediaQuery.of(context).size.width <= vScreenWidthXl1
                        ? MediaQuery.of(context).size.width / 2.5
                        : MediaQuery.of(context).size.width <= vScreenWidthXl3
                            ? MediaQuery.of(context).size.width / 2.6
                            : MediaQuery.of(context).size.width <=
                                    vScreenWidthXxl
                                ? MediaQuery.of(context).size.width / 2.5
                                : MediaQuery.of(context).size.width / 2.3,
        child: Image(image: AssetImage("${AppImage.dashboardImage}model.png")));
  }
}
