import 'package:flutter/material.dart';
import 'package:hoster/core/locale/language.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/utils/app_size.dart';
import 'package:hoster/utils/app_sizedbox.dart';
import 'package:hoster/utils/keys.dart';
import 'package:hoster/widgets/components/drawer/custom_list_tile.dart';
import 'package:hoster/widgets/components/drawer/header.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  final String isTextstyleType;
  const CustomDrawer({Key? key, required this.isTextstyleType})
      : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool _isCollapsed = false;

  DarkThemeProvider? themeChange;

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);

    return SafeArea(
      child: AnimatedContainer(
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 500),
        width: _isCollapsed ? 300 : 70,
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDrawerHeader(isColapsed: _isCollapsed),
                  const Divider(color: Colors.grey),
                  CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: Icons.home_rounded,
                    title: Languages.of(context)!.home,
                    isTextstyleType: widget.isTextstyleType,
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(
                        introKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                  sizeBoxHeight(vDefaultPadding),
                  CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: Icons.price_check_rounded,
                    title: Languages.of(context)!.pricing,
                    isTextstyleType: widget.isTextstyleType,
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(
                        pricingKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                  sizeBoxHeight(vDefaultPadding),
                  CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: Icons.domain_rounded,
                    title: Languages.of(context)!.domain,
                    doHaveMoreOptions: Icons.arrow_forward_ios,
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(
                        domainKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                    isTextstyleType: widget.isTextstyleType,
                  ),
                  sizeBoxHeight(vDefaultPadding),
                  CustomListTile(
                    isCollapsed: _isCollapsed,
                    icon: Icons.email_rounded,
                    title: Languages.of(context)!.email,
                    isTextstyleType: widget.isTextstyleType,
                    onTap: () {
                      Navigator.pop(context);
                      Scrollable.ensureVisible(
                        emailKey.currentContext!,
                        duration: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                  const Divider(color: Colors.grey),
                ],
              ),
              Align(
                alignment: _isCollapsed
                    ? Alignment.bottomRight
                    : Alignment.bottomCenter,
                child: IconButton(
                  splashColor: Colors.transparent,
                  icon: Icon(
                    _isCollapsed
                        ? Icons.arrow_back_ios
                        : Icons.arrow_forward_ios,
                    color: themeChange!.darkTheme
                        ? AppColor.whiteColor
                        : AppColor.blackColor,
                    size: 16,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCollapsed = !_isCollapsed;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
