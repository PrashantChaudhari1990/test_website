import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/core/locale/locale_constant.dart';
import 'package:hoster/mobile_screens/domain.dart';
import 'package:hoster/mobile_screens/hosting_plans.dart';
import 'package:hoster/mobile_screens/intro.dart';
import 'package:hoster/mobile_screens/navbar.dart';
import 'package:hoster/mobile_screens/our_exclusive.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/keys.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  DarkThemeProvider? themeChange;
  bool isdefault = false;

  bool isenglish = true;
  bool isgujrati = false;
  bool ishindi = false;
  bool isfrench = false;
  bool isspanish = false;
  String isTextstyleType = '';
  bool isfontstylePoppins = true;
  bool isfontstylejost = false;
  bool isfontstylelato = false;
  bool isfontstylenunito = false;

  String isDirectionType = '';
  bool islefttoright = false;
  bool isrighttoleft = true;

  int selectedIndex = 1;

  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: themeChange!.darkTheme == true
          ? AppColor.blackColor
          : AppColor.whiteColor,
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width <= vScreenWidthSm ? 270 : 365,
        backgroundColor: isdefault && themeChange!.darkTheme == true
            ? AppColor.blackColor
            : AppColor.whiteColor,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            sizeBoxHeight(vDefaultPadding * 2.5),
            AppText(
                text: Languages.of(context)!.themeCustomizer,
                style: isTextstyleType),
            sizeBoxHeight(vDefaultPadding * 2.5),
            titleTile(Languages.of(context)!.darkTheme),
            sizeBoxHeight(vDefaultPadding * 1.5),
            darkThemeOtionsTile(),
            sizeBoxHeight(vDefaultPadding * 2.5),
            titleTile(Languages.of(context)!.fontFamilyBase),
            sizeBoxHeight(vDefaultPadding * 1.5),
            fontfamilyList(),
            sizeBoxHeight(vDefaultPadding * 2.5),
            titleTile(Languages.of(context)!.localization),
            sizeBoxHeight(vDefaultPadding * 1.5),
            languageChangeList(),
            sizeBoxHeight(vDefaultPadding * 2.5),
            titleTile(Languages.of(context)!.direction),
            sizeBoxHeight(vDefaultPadding * 1.5),
            directionChangeList(),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                initialIndex == 1
                    ? HostingPlansMob(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType)
                    : initialIndex == 2
                        ? DomainScreenMob(
                            isTextstyleType: isTextstyleType,
                            isDirectionType: isDirectionType)
                        : initialIndex == 3
                            ? OurExclusiveMob(
                                isTextstyleType: isTextstyleType,
                                isDirectionType: isDirectionType)
                            : IntroScreenMob(
                                isTextstyleType: isTextstyleType,
                                isDirectionType: isDirectionType),

                // Buttom(isTextstyleType: isTextstyleType),
                // CopyRight(isTextstyleType: isTextstyleType)
              ],
            ),
            NavBarMob(isTextstyleType: isTextstyleType),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        elevation: 0,
        backgroundColor: themeChange!.darkTheme
            ? Theme.of(context).cardColor
            : AppColor.navigationBarColor,
        color: AppColor.textColor,
        items: [
          TabItem(
              icon: Icon(Icons.home, color: AppColor.whiteColor),
              activeIcon: Icon(Icons.home, color: AppColor.blackColor)),
          TabItem(
              icon:
                  Icon(Icons.attach_money_rounded, color: AppColor.whiteColor),
              activeIcon:
                  Icon(Icons.attach_money_rounded, color: AppColor.blackColor)),
          TabItem(
              icon: Icon(Icons.domain_add_rounded, color: AppColor.whiteColor),
              activeIcon:
                  Icon(Icons.domain_add_rounded, color: AppColor.blackColor)),
          TabItem(
              icon: Icon(Icons.email_rounded, color: AppColor.whiteColor),
              activeIcon:
                  Icon(Icons.email_rounded, color: AppColor.blackColor)),
        ],
        initialActiveIndex: 0,
        onTap: (index) {
          setState(() {
            initialIndex = index;
          });
        },
      ),
    );
  }

  Widget titleTile(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 14),
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff0F65A2).withOpacity(0.10),
                offset: Offset.zero,
                blurRadius: 10,
                spreadRadius: 0)
          ]),
      child: AppText(
          text: title, color: AppColor.blackColor, style: isTextstyleType),
    );
  }

  Widget darkThemeOtionsTile() {
    return Row(
      children: [
        GFToggle(
          onChanged: (val) {
            if (themeChange?.darkTheme == false) {
              isdefault = val!;
              themeChange?.darkTheme = true;
            } else {
              isdefault = val!;
              themeChange?.darkTheme = false;
            }
          },
          value: isdefault,
          type: GFToggleType.ios,
        ),
        sizeBoxWidth(vDefaultPadding),
        Expanded(
            child: AppText(
                text: Languages.of(context)!.applyDarkTheme,
                style: isTextstyleType))
      ],
    );
  }

  Widget fontOptionsTile(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff002348).withOpacity(0.10),
                offset: Offset.zero,
                blurRadius: 4,
                spreadRadius: 0)
          ]),
      child: AppText(text: title),
    );
  }

  Widget langOtionsTile(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
                color: const Color(0xff002348).withOpacity(0.10),
                offset: Offset.zero,
                blurRadius: 4,
                spreadRadius: 0)
          ]),
      child: AppText(text: title),
    );
  }

  Widget fontfamilyList() {
    return Wrap(
      runSpacing: vDefaultPadding / 2.5,
      spacing: vDefaultPadding,
      children: [
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isfontstylePoppins
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.poppins,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isfontstylePoppins,
          onSelected: (value) {
            setState(() {
              isfontstylePoppins = value;
              isfontstylejost = false;
              isfontstylelato = false;
              isfontstylenunito = false;
              selectedIndex = 1;
              isTextstyleType = 'poppins';
            });
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isfontstylejost
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.jost,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isfontstylejost,
          onSelected: (value) {
            setState(() {
              isfontstylePoppins = false;
              isfontstylejost = value;
              isfontstylelato = false;
              isfontstylenunito = false;
              selectedIndex = 1;
              isTextstyleType = 'jost';
            });
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isfontstylelato
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.lato,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isfontstylelato,
          onSelected: (value) {
            setState(() {
              isfontstylePoppins = false;
              isfontstylejost = false;
              isfontstylelato = value;
              isfontstylenunito = false;
              selectedIndex = 1;
              isTextstyleType = 'lato';
            });
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isfontstylenunito
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.nunito,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isfontstylenunito,
          onSelected: (value) {
            setState(() {
              isfontstylePoppins = false;
              isfontstylejost = false;
              isfontstylelato = false;
              isfontstylenunito = value;
              selectedIndex = 1;
              isTextstyleType = 'nunito';
            });
          },
        ),
      ],
    );
  }

  Widget languageChangeList() {
    return Wrap(
      runSpacing: vDefaultPadding / 2.5,
      spacing: vDefaultPadding,
      children: [
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isenglish
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.english,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isenglish,
          onSelected: (value) {
            changeLanguage(context, "en");
            isfrench = false;
            isspanish = false;
            ishindi = false;
            isgujrati = false;
            isenglish = value;
            setState(() {});
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isgujrati
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.gujarati,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isgujrati,
          onSelected: (value) {
            changeLanguage(context, "gu");
            isfrench = false;
            isspanish = false;
            ishindi = false;
            isenglish = false;
            isgujrati = value;
            setState(() {});
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(ishindi
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.hindi,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: ishindi,
          onSelected: (value) {
            changeLanguage(context, "hi");
            isfrench = false;
            isenglish = false;
            isspanish = false;
            isgujrati = false;
            ishindi = value;
            setState(() {});
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isspanish
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.spanish,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isspanish,
          onSelected: (value) {
            changeLanguage(context, "es");
            ishindi = false;
            isenglish = false;
            isgujrati = false;
            isfrench = false;
            isspanish = value;
            setState(() {});
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isfrench
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.france,
              style: isTextstyleType,
              fontWeight: FontWeight.w400),
          selected: isfrench,
          onSelected: (value) {
            changeLanguage(context, "fr");
            isfrench = value;
            isenglish = false;
            isgujrati = false;
            isspanish = false;
            ishindi = false;
            setState(() {});
          },
        ),
      ],
    );
  }

  Widget directionChangeList() {
    return Wrap(
      runSpacing: vDefaultPadding / 1.5,
      spacing: vDefaultPadding / 1.5,
      children: [
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(islefttoright
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.lefttoright,
              style: isTextstyleType,
              textDirection: isDirectionType,
              fontWeight: FontWeight.w400),
          selected: islefttoright,
          onSelected: (value) {
            islefttoright = value;
            islefttoright = true;
            isrighttoleft = false;
            isDirectionType = 'lefttoright';
            setState(() {});
          },
        ),
        ChoiceChip(
          disabledColor: AppColor.whiteColor,
          color: MaterialStatePropertyAll(isrighttoleft
              ? const Color(0xffCFE3EF)
                  .withOpacity(themeChange!.darkTheme ? 0.3 : 1)
              : null),
          label: AppText(
              text: Languages.of(context)!.righttoleft,
              style: isTextstyleType,
              textDirection: isDirectionType,
              fontWeight: FontWeight.w400),
          selected: isrighttoleft,
          onSelected: (value) {
            isrighttoleft = value;
            islefttoright = false;
            isrighttoleft = true;
            isDirectionType = 'righttoleft';
            setState(() {});
          },
        ),
      ],
    );
  }
}
