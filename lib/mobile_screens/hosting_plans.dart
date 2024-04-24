import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/mobile_screens/hosting_service.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/widgets/app_button.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class HostingPlansMob extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const HostingPlansMob(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<HostingPlansMob> createState() => _HostingPlansMobState();
}

class _HostingPlansMobState extends State<HostingPlansMob> {
  DarkThemeProvider? themeChange;
  // final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);
    return Expanded(
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            sizeBoxHeight(80),
            Stack(
              children: [
                MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Image.asset(
                                  "${AppImage.hostimgplansImage}vector1.png",
                                  fit: BoxFit.contain,
                                )),
                          ),
                        ],
                      ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      headingText(),
                      sizeBoxHeight(MediaQuery.of(context).size.width <=
                              vScreenWidthSm
                          ? vDefaultPadding * 1
                          : MediaQuery.of(context).size.width <= vScreenWidthMd
                              ? vDefaultPadding * 1.1
                              : vDefaultPadding * 1.2),
                      discriptionText(),
                      sizeBoxHeight(MediaQuery.of(context).size.width <=
                              vScreenWidthSm
                          ? vDefaultPadding * 2
                          : MediaQuery.of(context).size.width <= vScreenWidthMd
                              ? vDefaultPadding * 3.1
                              : vDefaultPadding * 4.2),
                      MediaQuery.of(context).size.width <= vScreenWidthSm
                          ? pricingMob()
                          : plans(),
                    ],
                  ),
                ),
              ],
            ),
            HostingServiceMob(
                isTextstyleType: widget.isTextstyleType,
                isDirectionType: widget.isDirectionType),
            sizeBoxHeight(vDefaultPadding * 2),
          ],
        ),
      ),
    );
  }

  Widget headingText() {
    return AppText(
        text: Languages.of(context)!.plansTitle,
        style: widget.isTextstyleType,
        textDirection: widget.isDirectionType,
        textCenter: true,
        // color: AppColor.textColor,
        fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 13
            : MediaQuery.of(context).size.width <= vScreenWidthLg
                ? 25
                : MediaQuery.of(context).size.width <= vScreenWidthXl ||
                        MediaQuery.of(context).size.width <= vScreenWidthXl1
                    ? MediaQuery.of(context).size.width / 40
                    : MediaQuery.of(context).size.width / 50,
        fontWeight: FontWeight.w500);
  }

  Widget discriptionText() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: AppText(
          text: Languages.of(context)!.hostingDiscription,
          style: widget.isTextstyleType,
          textDirection: widget.isDirectionType,
          textCenter: true,
          color: themeChange!.darkTheme
              ? AppColor.whiteColor
              : AppColor.discriptionTextColor,
          fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
              ? MediaQuery.of(context).size.width / 30
              : MediaQuery.of(context).size.width <= vScreenWidthLg
                  ? 12
                  : MediaQuery.of(context).size.width <= vScreenWidthXl ||
                          MediaQuery.of(context).size.width <=
                              vScreenWidthXl1 ||
                          MediaQuery.of(context).size.width <=
                              vScreenWidthXl2 ||
                          MediaQuery.of(context).size.width <= vScreenWidthXl3
                      ? MediaQuery.of(context).size.width / 85
                      : MediaQuery.of(context).size.width / 100,
          fontWeight: FontWeight.normal),
    );
  }

  Widget plans() {
    return Center(
      child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? vDefaultPadding - 10
                  : vDefaultPadding * 1.5,
              vertical: vDefaultPadding),
          child: Wrap(
            runSpacing: vDefaultPadding,
            children: List.generate(
              MediaQuery.of(context).size.width <= vScreenWidthXl ? 3 : 4,
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: HoverCard(
                    isTextstyleType: widget.isTextstyleType,
                    themeChange: themeChange,
                    isDirectionType: widget.isDirectionType),
              ),
            ),
          )),
    );
  }

  Widget pricingMob() {
    return Wrap(
      children: List.generate(
        3,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: MediaQuery.of(context).size.width / 1,
            width: MediaQuery.of(context).size.width / 1.3,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: themeChange!.darkTheme
                    ? Theme.of(context).cardColor
                    : AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: themeChange!.darkTheme
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.10),
                    offset: const Offset(0, 3),
                    blurRadius: 1,
                    spreadRadius: 3.0,
                  ),
                ],
                border:
                    Border.all(color: AppColor.textColor.withOpacity(0.10))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 68,
                      width: 71,
                      child:
                          Image.asset("${AppImage.hostimgplansImage}plan.png")),
                  AppText(
                    text: Languages.of(context)!.sharedHosting,
                    style: widget.isTextstyleType,
                    textDirection: widget.isDirectionType,
                    fontWeight: FontWeight.w500,
                    fontsize: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Image.asset(
                                        "${AppImage.hostimgplansImage}true.png",
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                AppText(
                                    text: Languages.of(context)!
                                        .standardPerformance,
                                    style: widget.isTextstyleType,
                                    textDirection: widget.isDirectionType,
                                    fontWeight: FontWeight.w500,
                                    fontsize: 10),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Image.asset(
                                        "${AppImage.hostimgplansImage}true.png",
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                AppText(
                                  text: Languages.of(context)!.webHosting,
                                  style: widget.isTextstyleType,
                                  textDirection: widget.isDirectionType,
                                  color: themeChange!.darkTheme
                                      ? AppColor.whiteColor.withOpacity(0.8)
                                      : AppColor.discriptionTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontsize: 10,
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 15,
                                  width: 15,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3),
                                    child: Image.asset(
                                        "${AppImage.hostimgplansImage}true.png",
                                        fit: BoxFit.contain),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                AppText(
                                  text: Languages.of(context)!.free1click,
                                  style: widget.isTextstyleType,
                                  textDirection: widget.isDirectionType,
                                  color: themeChange!.darkTheme
                                      ? AppColor.whiteColor.withOpacity(0.8)
                                      : AppColor.discriptionTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontsize: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        text: Languages.of(context)!.startingat,
                        style: widget.isTextstyleType,
                        textDirection: widget.isDirectionType,
                        color: themeChange!.darkTheme
                            ? AppColor.whiteColor.withOpacity(0.8)
                            : AppColor.discriptionTextColor,
                        fontWeight: FontWeight.w500,
                        fontsize: 10,
                      ),
                      const SizedBox(width: 10),
                      AppText(
                        text: "\$10/mth",
                        fontWeight: FontWeight.w500,
                        textDirection: widget.isDirectionType,
                        fontsize: 20,
                      ),
                    ],
                  ),
                  button()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget button() {
    return AppButton(
        height: 40,
        width: 180,
        text: Languages.of(context)!.getStarted,
        style: widget.isTextstyleType,
        textcolor: AppColor.whiteColor,
        textSize: 12,
        textWeight: FontWeight.w600,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 8);
  }
}

class HoverCard extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  final DarkThemeProvider? themeChange;
  const HoverCard(
      {super.key,
      required this.isTextstyleType,
      required this.themeChange,
      required this.isDirectionType});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation _animation;
  late Animation padding;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween(begin: 1.0, end: 1.07).animate(CurvedAnimation(
        parent: _controller, curve: Curves.ease, reverseCurve: Curves.easeIn));
    padding = Tween(begin: 1.0, end: -10.0).animate(CurvedAnimation(
        parent: _controller, curve: Curves.ease, reverseCurve: Curves.easeIn));
    _controller.addListener(() {
      setState(() {});
    });
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          _controller.forward();
          _mouseEnter(true);
        });
      },
      onExit: (value) {
        setState(() {
          _controller.reverse();
          _mouseEnter(false);
        });
      },
      child: AnimatedContainer(
        height: 400,
        width: 225,
        transform: Matrix4(_animation.value, 0, 0, 0, 0, _animation.value, 0, 0,
            0, 0, 1, 0, padding.value, padding.value, 0, 1),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.themeChange!.darkTheme
                ? Theme.of(context).cardColor
                : AppColor.whiteColor,
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: widget.themeChange!.darkTheme
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.10),
                  // offset: const Offset(0, 3),
                  offset: const Offset(0, 20),
                  blurRadius: 50,
                  spreadRadius: 3.0,
                ),
            ],
            border: Border.all(color: AppColor.textColor.withOpacity(0.10))),
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: widget.isDirectionType == "righttoleft" ||
                    widget.isDirectionType == ""
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              SizedBox(
                  height: 68,
                  width: 71,
                  child: Image.asset("${AppImage.hostimgplansImage}plan.png")),
              AppText(
                text: Languages.of(context)!.sharedHosting,
                style: widget.isTextstyleType,
                textDirection: widget.isDirectionType,
                color: widget.themeChange!.darkTheme
                    ? AppColor.whiteColor.withOpacity(0.8)
                    : AppColor.discriptionTextColor,
                fontWeight: FontWeight.w500,
                fontsize: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == ""
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == "",
                    child: Row(
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                                "${AppImage.hostimgplansImage}true.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                        sizeBoxWidth(10)
                      ],
                    ),
                  ),
                  AppText(
                    text: Languages.of(context)!.standardPerformance,
                    style: widget.isTextstyleType,
                    textDirection: widget.isDirectionType,
                    color: widget.themeChange!.darkTheme
                        ? AppColor.whiteColor.withOpacity(0.8)
                        : AppColor.discriptionTextColor,
                    fontWeight: FontWeight.w500,
                    fontsize: 10,
                  ),
                  Visibility(
                    visible: widget.isDirectionType == "lefttoright",
                    child: Row(
                      children: [
                        sizeBoxWidth(10),
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                                "${AppImage.hostimgplansImage}true.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == ""
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == "",
                    child: Row(
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                                "${AppImage.hostimgplansImage}true.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                        sizeBoxWidth(10)
                      ],
                    ),
                  ),
                  AppText(
                    text: Languages.of(context)!.webHosting,
                    style: widget.isTextstyleType,
                    textDirection: widget.isDirectionType,
                    color: widget.themeChange!.darkTheme
                        ? AppColor.whiteColor.withOpacity(0.8)
                        : AppColor.discriptionTextColor,
                    fontWeight: FontWeight.w500,
                    fontsize: 10,
                  ),
                  Visibility(
                    visible: widget.isDirectionType == "lefttoright",
                    child: Row(
                      children: [
                        sizeBoxWidth(10),
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                                "${AppImage.hostimgplansImage}true.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == ""
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  Visibility(
                    visible: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == "",
                    child: Row(
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                                "${AppImage.hostimgplansImage}true.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                        sizeBoxWidth(10)
                      ],
                    ),
                  ),
                  AppText(
                    text: Languages.of(context)!.free1click,
                    style: widget.isTextstyleType,
                    textDirection: widget.isDirectionType,
                    color: widget.themeChange!.darkTheme
                        ? AppColor.whiteColor.withOpacity(0.8)
                        : AppColor.discriptionTextColor,
                    fontWeight: FontWeight.w500,
                    fontsize: 10,
                  ),
                  Visibility(
                    visible: widget.isDirectionType == "lefttoright",
                    child: Row(
                      children: [
                        sizeBoxWidth(10),
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Image.asset(
                                "${AppImage.hostimgplansImage}true.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == ""
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.end,
                children: [
                  AppText(
                    text: Languages.of(context)!.startingat,
                    style: widget.isTextstyleType,
                    textDirection: widget.isDirectionType,
                    color: widget.themeChange!.darkTheme
                        ? AppColor.whiteColor.withOpacity(0.8)
                        : AppColor.discriptionTextColor,
                    fontWeight: FontWeight.w500,
                    fontsize: 10,
                  ),
                  const SizedBox(width: 10),
                  AppText(
                    text: "\$10/mth",
                    textDirection: widget.isDirectionType,
                    fontWeight: FontWeight.w500,
                    fontsize: 20,
                  ),
                ],
              ),
              button()
            ],
          ),
        ),
      ),
    );
  }

  Widget button() {
    return AppButton(
        height: 40,
        width: 180,
        text: Languages.of(context)!.getStarted,
        style: widget.isTextstyleType,
        textcolor: AppColor.whiteColor,
        textSize: 12,
        textWeight: FontWeight.w600,
        buttoncolor: AppColor.buttonColor,
        onPressed: () {},
        borderRadius: 8);
  }
}
