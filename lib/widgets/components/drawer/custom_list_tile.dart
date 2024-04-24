import 'package:flutter/material.dart';
import 'package:hoster/theme/dark_theme_provider.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/widgets/app_text.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatefulWidget {
  final bool isCollapsed;
  final IconData icon;
  final String title;
  final IconData? doHaveMoreOptions;
  final String isTextstyleType;
  final void Function()? onTap;

  const CustomListTile({
    Key? key,
    required this.isCollapsed,
    required this.icon,
    required this.title,
    this.doHaveMoreOptions,
    required this.isTextstyleType,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  DarkThemeProvider? themeChange;

  @override
  Widget build(BuildContext context) {
    themeChange = Provider.of<DarkThemeProvider>(context);

    return InkWell(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: widget.isCollapsed ? 300 : 80,
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(widget.icon,
                        color: themeChange!.darkTheme
                            ? AppColor.whiteColor
                            : AppColor.blackColor),
                  ],
                ),
              ),
            ),
            if (widget.isCollapsed) const SizedBox(width: 10),
            if (widget.isCollapsed)
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: AppText(
                        text: widget.title,
                        style: widget.isTextstyleType,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
              ),
            if (widget.isCollapsed) const Spacer(),
          ],
        ),
      ),
    );
  }
}
