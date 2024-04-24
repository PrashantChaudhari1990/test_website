import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/mobile_screens/days_money_back.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/widgets/app_button.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class DomainScreenMob extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const DomainScreenMob(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<DomainScreenMob> createState() => _DomainScreenMobState();
}

class _DomainScreenMobState extends State<DomainScreenMob> {
  DarkThemeProvider? themeChange;

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);

    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            sizeBoxHeight(60),
            Container(
              // height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "${AppImage.domainImage}${themeChange!.darkTheme ? "background_dark.png" : "background.jpg"}"),
                      fit: BoxFit.cover)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthSm
                        ? vDefaultPadding * 1.5
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? vDefaultPadding * 1.5
                            : vDefaultPadding * 1.5),
                    headerText(),
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthSm
                        ? vDefaultPadding * 1.5
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? vDefaultPadding * 1.5
                            : vDefaultPadding * 1.5),
                    description(),
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthSm
                        ? vDefaultPadding * 1.5
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? vDefaultPadding * 1.5
                            : vDefaultPadding * 1.5),
                    input(),
                    sizeBoxHeight(MediaQuery.of(context).size.width <=
                            vScreenWidthSm
                        ? vDefaultPadding * 1.5
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? vDefaultPadding * 1.5
                            : vDefaultPadding * 1.5),
                  ],
                ),
              ),
            ),
            DaysMoneyBackMob(
              isTextstyleType: widget.isTextstyleType,
              isDirectionType: widget.isDirectionType,
            ),
            sizeBoxHeight(vDefaultPadding * 2),
          ],
        ),
      ),
    );
  }

  Widget headerText() {
    return AppText(
      text: Languages.of(context)!.domainTitle,
      style: widget.isTextstyleType,
      textCenter: true,
      fontWeight: FontWeight.w500,
      fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 13
          : MediaQuery.of(context).size.width <= vScreenWidthLg
              ? 25
              : MediaQuery.of(context).size.width <= vScreenWidthXl ||
                      MediaQuery.of(context).size.width <= vScreenWidthXl1
                  ? MediaQuery.of(context).size.width / 40
                  : MediaQuery.of(context).size.width / 50,
    );
  }

  Widget description() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AppText(
        text: Languages.of(context)!.domainDiscription,
        style: widget.isTextstyleType,
        fontWeight: FontWeight.w500,
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
      ),
    );
  }

  Widget input() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        textfield(),
        sizeBoxWidth(MediaQuery.of(context).size.width <= vScreenWidthSm
            ? vDefaultPadding / 2
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? vDefaultPadding * 1.5
                : vDefaultPadding * 1.5),
        button()
      ],
    );
  }

  Widget textfield() {
    return SizedBox(
      height: MediaQuery.of(context).size.height <= vScreenWidthSm
          ? MediaQuery.of(context).size.height / 20
          : MediaQuery.of(context).size.height / 19,
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 2
          : MediaQuery.of(context).size.width <= vScreenWidthLg
              ? MediaQuery.of(context).size.width / 4
              : MediaQuery.of(context).size.width / 5.5,
      child: TextFormField(
        cursorColor: AppColor.buttonColor,
        decoration: InputDecoration(
            filled: true,
            fillColor: themeChange!.darkTheme
                ? AppColor.discriptionColor.withOpacity(0.1)
                : AppColor.whiteColor,
            contentPadding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width <= vScreenWidthSm
                    ? 10
                    : 0,
                right: 10),
            prefixIcon: Image.asset("${AppImage.domainImage}search.png",
                filterQuality: FilterQuality.high,
                color: themeChange!.darkTheme
                    ? AppColor.whiteColor
                    : AppColor.blackColor),
            hintText: Languages.of(context)!.enterDomain,
            hintStyle: TextStyle(
                fontFamily: widget.isTextstyleType,
                color: themeChange!.darkTheme
                    ? AppColor.whiteColor.withOpacity(0.5)
                    : AppColor.discriptionColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.textColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.buttonColor))),
      ),
    );
  }

  Widget button() {
    return AppButton(
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.height / 7,
        text: Languages.of(context)!.search,
        style: widget.isTextstyleType,
        textcolor: AppColor.whiteColor,
        textSize: 13,
        textWeight: FontWeight.bold,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 10);
  }
}
