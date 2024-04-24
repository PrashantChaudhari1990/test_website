// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_element, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/core/locale/locale_constant.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/utils/app_textstyle.dart';
import 'package:hoster/web_screens/buttom.dart';
import 'package:hoster/web_screens/copy_right.dart';
import 'package:hoster/web_screens/days_money_back.dart';
import 'package:hoster/web_screens/domain.dart';
import 'package:hoster/web_screens/hosting_plans.dart';
import 'package:hoster/web_screens/hosting_service.dart';
import 'package:hoster/web_screens/international_hosting.dart';
import 'package:hoster/web_screens/intro.dart';
import 'package:hoster/web_screens/our_exclusive.dart';
import 'package:hoster/web_screens/sponsor_brands.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/web_screens/navbar.dart';
import 'package:hoster/utils/keys.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hoster/widgets/components/drawer/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  final ScrollController _scrollController = ScrollController();
  bool showButton = false;

  List tabScreenKeys = [introKey, pricingKey, domainKey, emailKey];

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    @override
    void initState() {
      showButton = false;
      super.initState();
    }

    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset >= 300) {
          showButton = true;
        } else {
          showButton = false;
        }
      });
    });

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: themeChange!.darkTheme == true
          ? AppColor.blackColor
          : AppColor.whiteColor,
      drawer: CustomDrawer(isTextstyleType: isTextstyleType),

      // Drawer(
      //   width: MediaQuery.of(context).size.width <= vScreenWidthSm ? 300 : 365,
      //   shape: Border(right: BorderSide(color: AppColor.whiteColor)),
      //   backgroundColor: isdefault && themeChange!.darkTheme == true
      //       ? AppColor.blackColor
      //       : AppColor.whiteColor,
      //   child: ListView(
      //     padding: const EdgeInsets.all(0),
      //     children: [
      //       sizeBoxHeight(vDefaultPadding * 1.5),
      //       searchTextField(),
      //       sizeBoxHeight(vDefaultPadding),
      //       drawerList(const Icon(Icons.home_rounded, size: 30),
      //           Languages.of(context)!.home, 1, introKey),
      //       const Divider(),
      //       drawerList(const Icon(Icons.price_check_rounded, size: 30),
      //           Languages.of(context)!.pricing, 2, pricingKey),
      //       const Divider(),
      //       drawerList(const Icon(Icons.domain_rounded, size: 30),
      //           Languages.of(context)!.domain, 3, domainKey),
      //       const Divider(),
      //       drawerList(const Icon(Icons.email_rounded, size: 30),
      //           Languages.of(context)!.email, 4, emailKey),
      //     ],
      //   ),
      // ),

      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width <= vScreenWidthSm ? 300 : 365,
        shape: Border(left: BorderSide(color: AppColor.whiteColor)),
        backgroundColor: isdefault && themeChange!.darkTheme == true
            ? AppColor.blackColor
            : AppColor.whiteColor,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            sizeBoxHeight(vDefaultPadding * 2.5),
            AppText(
                text: Languages.of(context)!.themeCustomizer,
                textDirection: isDirectionType,
                style: isTextstyleType),
            sizeBoxHeight(vDefaultPadding * 2.5),
            titleTile(Languages.of(context)!.darkTheme),
            sizeBoxHeight(vDefaultPadding * 1.5),
            darkThemeOtionsTile(),
            sizeBoxHeight(vDefaultPadding * 2.5),
            titleTile(Languages.of(context)!.fontFamilyBase),
            sizeBoxHeight(vDefaultPadding * 1.5),
            fontfamilyChangeList(),
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
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                overscroll: false,
                dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
              ),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IntroScreen(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    SponsorListView(isTextstyleType: isTextstyleType),
                    Column(key: pricingKey, children: [sizeBoxHeight(100)]),
                    HostingPlans(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    Column(key: domainKey, children: [sizeBoxHeight(100)]),
                    DomainScreen(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    HostingService(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    sizeBoxHeight(100),
                    InternationalHosting(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    DaysMoneyBack(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    sizeBoxHeight(50),
                    OurExclusive(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    sizeBoxHeight(50),
                    Buttom(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType),
                    CopyRight(
                        isTextstyleType: isTextstyleType,
                        isDirectionType: isDirectionType)
                  ],
                ),
              ),
            ),
            NavBar(isTextstyleType: isTextstyleType),
          ],
        ),
      ),
      // bottomNavigationBar: MediaQuery.of(context).size.width <= vScreenWidthMd
      //     ? ConvexAppBar(
      //         elevation: 0,
      //         backgroundColor: AppColor.navigationBarColor,
      //         color: AppColor.textColor,
      //         items: [
      //           TabItem(
      //               icon: Icon(Icons.home, color: AppColor.whiteColor),
      //               activeIcon: Icon(Icons.home, color: AppColor.blackColor)),
      //           TabItem(
      //               icon: Icon(Icons.attach_money_rounded,
      //                   color: AppColor.whiteColor),
      //               activeIcon: Icon(Icons.attach_money_rounded,
      //                   color: AppColor.blackColor)),
      //           TabItem(
      //               icon: Icon(Icons.domain_add_rounded,
      //                   color: AppColor.whiteColor),
      //               activeIcon: Icon(Icons.domain_add_rounded,
      //                   color: AppColor.blackColor)),
      //           TabItem(
      //               icon: Icon(Icons.email_rounded, color: AppColor.whiteColor),
      //               activeIcon:
      //                   Icon(Icons.email_rounded, color: AppColor.blackColor)),
      //         ],
      //         initialActiveIndex: 0,
      //         onTap: (index) {
      //           setState(() {
      //             Scrollable.ensureVisible(
      //               tabScreenKeys[index].currentContext!,
      //               duration: const Duration(seconds: 1),
      //               curve: Curves.easeInOut,
      //             );
      //           });
      //         },
      //       )
      //     : const SizedBox.shrink(),
      floatingActionButton: showButton == true
          ? FloatingActionButton(
              backgroundColor: AppColor.whiteColor,
              onPressed: () {
                if (_scrollController.hasClients) {
                  final position = _scrollController.position.minScrollExtent;
                  _scrollController.animateTo(
                    position,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeOut,
                  );
                }
              },
              isExtended: true,
              tooltip: "Scroll to top",
              child: Icon(Icons.keyboard_double_arrow_up_rounded,
                  color: AppColor.textColor),
            )
          : null,
    );
  }

  Widget drawerList(
      Icon icon, String text, int index, GlobalKey<State<StatefulWidget>> key) {
    return Padding(
      padding: const EdgeInsets.all(vDefaultPadding - 6),
      child: ListTile(
        onTap: () {
          Navigator.pop(context);
          Scrollable.ensureVisible(
            key.currentContext!,
            duration: const Duration(milliseconds: 500),
          ).then((value) {
            selectedIndex = index;
            setState(() {});
          });
        },
        leading: icon,
        title: AppText(
            text: text,
            style: isTextstyleType,
            textDirection: isDirectionType,
            fontsize: 20,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget searchTextField() {
    return Padding(
      padding: const EdgeInsets.all(vDefaultPadding * 3 - 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 10,
              spreadRadius: 0,
              color: AppColor.buttomBackGround.withOpacity(0.04))
        ]),
        child: TextField(
          cursorColor: AppColor.buttomBackGround,
          cursorHeight: vDefaultPadding,
          decoration: InputDecoration(
            filled: true,
            fillColor: themeChange!.darkTheme
                ? AppColor.discriptionColor.withOpacity(0.1)
                : AppColor.whiteColor,
            contentPadding: const EdgeInsets.only(left: vDefaultPadding * 2),
            hintText: Languages.of(context)!.searchSomething,
            hintStyle: textStyle(
                isTextstyleType,
                FontWeight.normal,
                13,
                themeChange!.darkTheme
                    ? AppColor.whiteColor.withOpacity(0.5)
                    : AppColor.discriptionColor),
            hoverColor: Colors.transparent,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(vDefaultPadding - 1),
                borderSide: BorderSide(
                    color: const Color(0xffA6AAB4).withOpacity(0.20))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(vDefaultPadding - 1),
                borderSide: BorderSide(color: AppColor.buttomBackGround)),
            suffixIcon: Image.asset("${AppImage.domainImage}search.png",
                color: themeChange!.darkTheme
                    ? AppColor.whiteColor
                    : AppColor.blackColor),
          ),
        ),
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
          text: title,
          color: AppColor.blackColor,
          style: isTextstyleType,
          textDirection: isDirectionType),
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
                style: isTextstyleType,
                textDirection: isDirectionType))
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
      child: AppText(text: title, textDirection: isDirectionType),
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
      child: AppText(text: title, textDirection: isDirectionType),
    );
  }

  Widget fontfamilyChangeList() {
    return Wrap(
      runSpacing: vDefaultPadding / 1.5,
      spacing: vDefaultPadding / 1.5,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
      runSpacing: vDefaultPadding / 1.5,
      spacing: vDefaultPadding / 1.5,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
              textDirection: isDirectionType,
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
