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

class DaysMoneyBackMob extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const DaysMoneyBackMob(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<DaysMoneyBackMob> createState() => DDaysMoneyBackMobState();
}

class DDaysMoneyBackMobState extends State<DaysMoneyBackMob> {
  DarkThemeProvider? themeChange;
  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return MediaQuery.of(context).size.width <= vScreenWidthSm
        ? moneyBackMob()
        : Container(
            height: MediaQuery.of(context).size.width / 3,
            width: MediaQuery.of(context).size.width,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  "${AppImage.moneyBackImage}${themeChange!.darkTheme ? widget.isDirectionType == "righttoleft" || widget.isDirectionType == "" ? "background_dark.png" : "bg_dark_right.png" : widget.isDirectionType == "righttoleft" || widget.isDirectionType == "" ? "background.png" : "bg_right.png"}"),
            )),
            child: widget.isDirectionType == "righttoleft" ||
                    widget.isDirectionType == ""
                ? Padding(
                    padding: EdgeInsets.only(
                        left:
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 13
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthMd
                                    ? vDefaultPadding * 18
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthXl
                                        ? vDefaultPadding * 23
                                        : MediaQuery.of(context).size.width <=
                                                vScreenWidthXl3
                                            ? vDefaultPadding * 25
                                            : vDefaultPadding * 40),
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width <=
                                vScreenWidthSm
                            ? MediaQuery.of(context).size.height / 6
                            : MediaQuery.of(context).size.width <=
                                    vScreenWidthMd
                                ? MediaQuery.of(context).size.height / 4.8
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthXl
                                    ? MediaQuery.of(context).size.height / 3.8
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthXl2
                                        ? MediaQuery.of(context).size.height / 3
                                        : MediaQuery.of(context).size.height /
                                            2.2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              title(),
                              hadline(),
                              button(),
                              discription()
                            ]),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(
                        right:
                            MediaQuery.of(context).size.width <= vScreenWidthSm
                                ? vDefaultPadding * 13
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthMd
                                    ? vDefaultPadding * 18
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthXl
                                        ? vDefaultPadding * 23
                                        : MediaQuery.of(context).size.width <=
                                                vScreenWidthXl3
                                            ? vDefaultPadding * 25
                                            : vDefaultPadding * 40),
                    child: Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.width <=
                                vScreenWidthSm
                            ? MediaQuery.of(context).size.height / 6
                            : MediaQuery.of(context).size.width <=
                                    vScreenWidthMd
                                ? MediaQuery.of(context).size.height / 4.8
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthXl
                                    ? MediaQuery.of(context).size.height / 3.8
                                    : MediaQuery.of(context).size.width <=
                                            vScreenWidthXl2
                                        ? MediaQuery.of(context).size.height / 3
                                        : MediaQuery.of(context).size.height /
                                            2.2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              title(),
                              hadline(),
                              button(),
                              discription()
                            ]),
                      ),
                    ),
                  ),
          );
  }

  Widget moneyBackMob() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                '${AppImage.moneyBackImage}${themeChange!.darkTheme ? "bg_mob_dark.png" : "bg_mob.png"}'),
            fit: BoxFit.fill),
      ),
      child: Column(
        children: [
          sizeBoxHeight(MediaQuery.of(context).size.width / 2),
          title(),
          sizeBoxHeight(vDefaultPadding * 1.5),
          hadline(),
          sizeBoxHeight(vDefaultPadding * 1.5),
          discription(),
          sizeBoxHeight(vDefaultPadding * 1.5),
          button(),
          // sizeBoxHeight(vDefaultPadding * 5),
          sizeBoxHeight(MediaQuery.of(context).size.width / 2.8),
        ],
      ),
    );
  }

  Widget title() {
    return AppText(
      text: Languages.of(context)!.stopWorries,
      style: widget.isTextstyleType,
      textDirection: widget.isDirectionType,
      fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 35
          : MediaQuery.of(context).size.width / 60,
      fontWeight: FontWeight.w600,
    );
  }

  Widget hadline() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: Languages.of(context)!.days,
          style: textStyle(
            widget.isTextstyleType,
            FontWeight.w600,
            MediaQuery.of(context).size.width <= vScreenWidthSm
                ? MediaQuery.of(context).size.width / 23
                : MediaQuery.of(context).size.width / 40,
            AppColor.highlighttextColor,
          )),
      TextSpan(
          text: Languages.of(context)!.moneyback,
          style: textStyle(
            widget.isTextstyleType,
            FontWeight.w500,
            MediaQuery.of(context).size.width <= vScreenWidthSm
                ? MediaQuery.of(context).size.width / 23
                : MediaQuery.of(context).size.width / 40,
            themeChange!.darkTheme ? AppColor.whiteColor : AppColor.blackColor,
          ))
    ]));
  }

  Widget button() {
    return AppButton(
        height: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 10
            : MediaQuery.of(context).size.width / 37,
        width: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 2
            : MediaQuery.of(context).size.width / 8,
        text: Languages.of(context)!.startNow,
        style: widget.isTextstyleType,
        textcolor: AppColor.whiteColor,
        textSize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 28
            : MediaQuery.of(context).size.width / 90,
        textWeight: FontWeight.bold,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 30);
  }

  Widget discription() {
    return AppText(
      text: Languages.of(context)!.cancellation,
      style: widget.isTextstyleType,
      textDirection: widget.isDirectionType,
      textCenter: true,
      fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 30
          : MediaQuery.of(context).size.width <= vScreenWidthLg
              ? MediaQuery.of(context).size.width / 60
              : MediaQuery.of(context).size.width <= vScreenWidthXl
                  ? MediaQuery.of(context).size.width / 80
                  : MediaQuery.of(context).size.width / 120,
      fontWeight: FontWeight.w600,
    );
  }
}
