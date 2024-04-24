import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_image.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/widgets/app_button.dart';
import 'package:hoster/widgets/app_text.dart';

class HostingServiceMob extends StatefulWidget {
  final String isTextstyleType;
  final String isDirectionType;

  const HostingServiceMob(
      {super.key,
      required this.isTextstyleType,
      required this.isDirectionType});

  @override
  State<HostingServiceMob> createState() => _HostingServiceMobState();
}

class _HostingServiceMobState extends State<HostingServiceMob> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width <= vScreenWidthMd
          ? MediaQuery.of(context).size.width / 2.5
          : MediaQuery.of(context).size.width <= vScreenWidthXl
              ? MediaQuery.of(context).size.width / 2.8
              : MediaQuery.of(context).size.height / 2.5,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  AssetImage("${AppImage.hostingserviceImage}background.png"),
              fit: BoxFit.fill)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                  visible: MediaQuery.of(context).size.width <= vScreenWidthSm,
                  child: text()),
              Expanded(
                child: widget.isDirectionType == "righttoleft" ||
                        widget.isDirectionType == ""
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          image(),
                          sizeBoxWidth(vDefaultPadding),
                          ditails()
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ditails(),
                          sizeBoxWidth(vDefaultPadding),
                          image()
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget image() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: SizedBox(
          width: MediaQuery.of(context).size.width <= vScreenWidthSm
              ? MediaQuery.of(context).size.width / 3
              : MediaQuery.of(context).size.width <= vScreenWidthMd
                  ? MediaQuery.of(context).size.width / 3.1
                  : MediaQuery.of(context).size.width / 3.5,
          child: Image.asset("${AppImage.hostingserviceImage}image.png")),
    );
  }

  Widget ditails() {
    return SizedBox(
      width: MediaQuery.of(context).size.width <= vScreenWidthSm
          ? MediaQuery.of(context).size.width / 1.85
          : MediaQuery.of(context).size.width <= vScreenWidthXl1
              ? MediaQuery.of(context).size.width / 2
              : MediaQuery.of(context).size.width / 2.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Visibility(
              visible: MediaQuery.of(context).size.width > vScreenWidthSm,
              child: text()),
          contact(),
          button()
        ],
      ),
    );
  }

  Widget text() {
    return AppText(
        text: Languages.of(context)!.hostingService,
        style: widget.isTextstyleType,
        textDirection: widget.isDirectionType,
        textCenter: true,
        maxLines: 2,
        color: AppColor.whiteColor,
        fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 30
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 35
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? MediaQuery.of(context).size.width / 30
                    : MediaQuery.of(context).size.height / 25,
        fontWeight: FontWeight.w500);
  }

  Widget contact() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        contractDitails("${AppImage.hostingserviceImage}call.png",
            Languages.of(context)!.ourHotLine, '+880 123 4567'),
        sizeBoxWidth(vDefaultPadding
            // MediaQuery.of(context).size.width <= vScreenWidthSm
            //   ? vDefaultPadding * 1.5
            //   : MediaQuery.of(context).size.width <= vScreenWidthMd
            //       ? vDefaultPadding * 2.5
            //       : vDefaultPadding * 4
            ),
        contractDitails("${AppImage.hostingserviceImage}message.png",
            Languages.of(context)!.mailUs, 'Info@gmail.com'),
      ],
    );
  }

  Widget contractDitails(String image, String header, String ditails) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: widget.isDirectionType == "righttoleft" ||
              widget.isDirectionType == "",
          child: Row(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.width <= vScreenWidthSm
                      ? MediaQuery.of(context).size.height / 15
                      : MediaQuery.of(context).size.width <= vScreenWidthMd
                          ? MediaQuery.of(context).size.height / 19.5
                          : MediaQuery.of(context).size.height / 19,
                  width: MediaQuery.of(context).size.width <= vScreenWidthSm
                      ? MediaQuery.of(context).size.width / 15
                      : MediaQuery.of(context).size.width <= vScreenWidthMd
                          ? MediaQuery.of(context).size.width / 19.5
                          : MediaQuery.of(context).size.width / 19,
                  child: Image.asset(image)),
              sizeBoxWidth(MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? vDefaultPadding * 0.5
                  : MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? vDefaultPadding * 0.5
                      : vDefaultPadding * 0.5),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: widget.isDirectionType == "lefttoright"
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            AppText(
              text: header,
              style: widget.isTextstyleType,
              color: AppColor.whiteColor,
              fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? MediaQuery.of(context).size.width / 50
                  : MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? MediaQuery.of(context).size.width / 56
                      : MediaQuery.of(context).size.width <= vScreenWidthXl
                          ? MediaQuery.of(context).size.width / 50
                          : MediaQuery.of(context).size.height / 49,
              fontWeight: FontWeight.w500,
            ),
            AppText(
              text: ditails,
              color: AppColor.whiteColor,
              fontsize: MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? MediaQuery.of(context).size.width / 50
                  : MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? MediaQuery.of(context).size.width / 60
                      : MediaQuery.of(context).size.width <= vScreenWidthXl
                          ? MediaQuery.of(context).size.width / 50
                          : MediaQuery.of(context).size.height / 49,
              fontWeight: FontWeight.normal,
            )
          ],
        ),
        Visibility(
          visible: widget.isDirectionType == "lefttoright",
          child: Row(
            children: [
              sizeBoxWidth(MediaQuery.of(context).size.width <= vScreenWidthSm
                  ? vDefaultPadding * 0.5
                  : MediaQuery.of(context).size.width <= vScreenWidthMd
                      ? vDefaultPadding * 0.5
                      : vDefaultPadding * 0.5),
              SizedBox(
                  height: MediaQuery.of(context).size.width <= vScreenWidthSm
                      ? MediaQuery.of(context).size.height / 15
                      : MediaQuery.of(context).size.width <= vScreenWidthMd
                          ? MediaQuery.of(context).size.height / 19.5
                          : MediaQuery.of(context).size.height / 19,
                  width: MediaQuery.of(context).size.width <= vScreenWidthSm
                      ? MediaQuery.of(context).size.width / 15
                      : MediaQuery.of(context).size.width <= vScreenWidthMd
                          ? MediaQuery.of(context).size.width / 19.5
                          : MediaQuery.of(context).size.width / 19,
                  child: Image.asset(image)),
            ],
          ),
        ),
      ],
    );
  }

  Widget button() {
    return AppButton(
        height: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 15
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 15
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? MediaQuery.of(context).size.width / 20
                    : MediaQuery.of(context).size.height / 15,
        width: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 5
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 5
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? MediaQuery.of(context).size.width / 5
                    : MediaQuery.of(context).size.height / 5,
        text: Languages.of(context)!.contactWithUs,
        style: widget.isTextstyleType,
        textcolor: AppColor.textColor,
        textSize: MediaQuery.of(context).size.width <= vScreenWidthSm
            ? MediaQuery.of(context).size.width / 55
            : MediaQuery.of(context).size.width <= vScreenWidthMd
                ? MediaQuery.of(context).size.width / 53
                : MediaQuery.of(context).size.width <= vScreenWidthXl
                    ? MediaQuery.of(context).size.width / 52
                    : MediaQuery.of(context).size.height / 50,
        textWeight: FontWeight.w500,
        buttoncolor: AppColor.whiteColor,
        onPressed: () {},
        borderRadius: 6);
  }
}
