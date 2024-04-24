import 'package:carousel_slider/carousel_slider.dart';
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
import 'package:circular_reveal_animation/circular_reveal_animation.dart';

class OurExclusive extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;
  const OurExclusive(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<OurExclusive> createState() => _OurExclusive();
}

class _OurExclusive extends State<OurExclusive> {
  DarkThemeProvider? themeChange;
  final CarouselController _controller = CarouselController();
  late int _current = 0;

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
    return Stack(
      children: [
        MediaQuery.of(context).size.width <= vScreenWidthLg
            ? const SizedBox.shrink()
            : Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Image.asset(
                        "${AppImage.ourexclusiveImage}vector1.png",
                        fit: BoxFit.contain,
                      )),
                ],
              ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? 0
                  : vDefaultPadding),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title(),
                sizeBoxHeight(
                    MediaQuery.of(context).size.width <= vScreenWidthSm
                        ? vDefaultPadding * 1
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? vDefaultPadding * 1.1
                            : vDefaultPadding * 2),
                discription(),
                sizeBoxHeight(MediaQuery.of(context).size.width <=
                        vScreenWidthSm
                    ? vDefaultPadding * 3
                    : MediaQuery.of(context).size.width <= vScreenWidthLg
                        ? vDefaultPadding * 2
                        : MediaQuery.of(context).size.width <= vScreenWidthMd
                            ? vDefaultPadding * 1.1
                            : vDefaultPadding * 4),
                MediaQuery.of(context).size.width <= vScreenWidthLg
                    ? carousel(dataList)
                    : agents(dataList),
                SizedBox(key: emailKey),
                // sizeBoxHeight(MediaQuery.of(context).size.width <=
                //         vScreenWidthSm
                //     ? vDefaultPadding * 5
                //     : MediaQuery.of(context).size.width <= vScreenWidthLg
                //         ? vDefaultPadding * 2
                //         : MediaQuery.of(context).size.width <= vScreenWidthMd
                //             ? vDefaultPadding * 1.1
                //             : vDefaultPadding * 4),
                sizeBoxHeight(100),
                subscribe(),
              ],
            ),
          ),
        ),
      ],
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
                  child: AgentsList(
                      image: e['image'],
                      name: e['name'],
                      catogari: e['catogari'],
                      phone: e['phone'],
                      isTextstyleType: widget.isTextstyleType,
                      themeChange: themeChange)),
            )
            .toList());
  }

  Widget carousel(List dataList) {
    return Column(
      children: [
        CarouselSlider(
          items: dataList
              .map(
                (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    child: AgentsList(
                        image: e['image'],
                        name: e['name'],
                        catogari: e['catogari'],
                        phone: e['phone'],
                        isTextstyleType: widget.isTextstyleType,
                        themeChange: themeChange)),
              )
              .toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            height: 370,
            enlargeCenterPage: true,
            enlargeFactor: 0.2,
            autoPlay: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            viewportFraction:
                MediaQuery.of(context).size.width <= vScreenWidthSm
                    ? 0.68
                    : MediaQuery.of(context).size.width <= vScreenWidthMd
                        ? 0.62
                        : MediaQuery.of(context).size.width <= vScreenWidthLg
                            ? 0.35
                            : 0.7,
          ),
        ),
        sizeBoxHeight(vDefaultPadding * 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dataList.asMap().entries.map((entry) {
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
                  : MediaQuery.of(context).size.width <= vScreenWidthLg
                      ? 50
                      : 100,
        ),
        child: Center(
          child: MediaQuery.of(context).size.width <= vScreenWidthSm
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      text(),
                      sizeBoxHeight(vDefaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textfield(),
                          sizeBoxWidth(MediaQuery.of(context).size.width <=
                                  vScreenWidthSm
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
                )
              : widget.isDirectionType == "righttoleft" ||
                      widget.isDirectionType == ""
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text(),
                        Row(
                          children: [
                            textfield(),
                            sizeBoxWidth(MediaQuery.of(context).size.width <=
                                    vScreenWidthSm
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
                        Row(
                          children: [
                            textfield(),
                            sizeBoxWidth(MediaQuery.of(context).size.width <=
                                    vScreenWidthSm
                                ? vDefaultPadding * 0.5
                                : MediaQuery.of(context).size.width <=
                                        vScreenWidthMd
                                    ? vDefaultPadding * 0.5
                                    : vDefaultPadding * 0.5),
                            button()
                          ],
                        ),
                        text(),
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
        textDirection: widget.isDirectionType,
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
              contentPadding:
                  const EdgeInsets.only(left: 10, right: 10, bottom: 20),
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

class AgentsList extends StatefulWidget {
  final String image;
  final String name;
  final String catogari;
  final String phone;
  final String isTextstyleType;
  final DarkThemeProvider? themeChange;
  const AgentsList(
      {super.key,
      required this.image,
      required this.name,
      required this.catogari,
      required this.phone,
      required this.isTextstyleType,
      this.themeChange});

  @override
  State<AgentsList> createState() => _AgentsListState();
}

class _AgentsListState extends State<AgentsList> with TickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation _animation;
  late Animation padding;

  AnimationController? animationController;
  Animation<double>? animation;
  late Color? startColor;
  late Color? targetColor;

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

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
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
          animationController!.forward();
          _mouseEnter(true);
        });
      },
      onExit: (value) {
        setState(() {
          _controller.reverse();
          animationController!.reverse();
          _mouseEnter(false);
        });
      },
      child: SizedBox(
        height: 350,
        width: 252,
        child: Stack(
          children: [
            AnimatedContainer(
              height: 350,
              width: 252,
              transform: Matrix4(_animation.value, 0, 0, 0, 0, _animation.value,
                  0, 0, 0, 0, 1, 0, padding.value, padding.value, 0, 1),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).cardColor,
                border: !_isHovered
                    ? Border.all(color: AppColor.textColor.withOpacity(0.10))
                    : null,
              ),
              duration: const Duration(milliseconds: 200),
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
                      child: Image.asset(widget.image),
                    ),
                    sizeBoxHeight(vDefaultPadding * 1.8),
                    AppText(
                        text: widget.name,
                        style: widget.isTextstyleType,
                        fontWeight: FontWeight.w600,
                        fontsize: 18),
                    AppText(
                        text: widget.catogari,
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
                                "${Languages.of(context)!.call}+${widget.phone}",
                            style: widget.isTextstyleType,
                            fontWeight: FontWeight.normal,
                            fontsize: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            CircularRevealAnimation(
              animation: animation!,
              centerAlignment: Alignment.bottomRight,
              child: AnimatedContainer(
                height: 350,
                width: 252,
                transform: Matrix4(
                    _animation.value,
                    0,
                    0,
                    0,
                    0,
                    _animation.value,
                    0,
                    0,
                    0,
                    0,
                    1,
                    0,
                    padding.value,
                    padding.value,
                    0,
                    1),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _isHovered
                        ? AppColor.iconBoxColor
                        : Theme.of(context).cardColor,
                    boxShadow: [
                      BoxShadow(
                        color: _isHovered
                            ? Colors.grey.withOpacity(
                                widget.themeChange!.darkTheme ? 0.05 : 0.10)
                            : Colors.transparent,
                        offset: const Offset(0, 10),
                        blurRadius: 10,
                        spreadRadius: 0,
                      )
                    ]),
                duration: const Duration(milliseconds: 200),
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
                        child: Image.asset(widget.image),
                      ),
                      sizeBoxHeight(vDefaultPadding * 1.8),
                      AppText(
                          text: widget.name,
                          style: widget.isTextstyleType,
                          fontWeight: FontWeight.w600,
                          fontsize: 18),
                      AppText(
                          text: widget.catogari,
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
                                  "${Languages.of(context)!.call}+${widget.phone}",
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
          ],
        ),
      ),
    );
  }
}
