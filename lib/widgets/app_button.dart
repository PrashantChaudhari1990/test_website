// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hoster/utils/app_colors.dart';
import 'package:hoster/widgets/app_text.dart';

class AppButton extends StatefulWidget {
  double? height;
  double? width;
  final String text;
  String? style;
  final Color textcolor;
  final double textSize;
  final FontWeight textWeight;
  final VoidCallback onPressed;
  final Color buttoncolor;
  final double borderRadius;
  EdgeInsetsGeometry? contentPadding;

  AppButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    this.style,
    this.contentPadding,
    required this.textcolor,
    required this.textSize,
    required this.textWeight,
    required this.onPressed,
    required this.buttoncolor,
    required this.borderRadius,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isHovered = false;

  void _mouseEnter(bool hover) {
    setState(() {
      _isHovered = hover;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onEnter: (event) => _mouseEnter(true),
        onExit: (event) => _mouseEnter(false),
        child: AnimatedContainer(
          height: widget.height,
          width: widget.width,
          padding: widget.contentPadding,
          decoration: BoxDecoration(
              color: !_isHovered ? widget.buttoncolor : AppColor.bluetextColor,
              borderRadius: BorderRadius.circular(widget.borderRadius)),
          duration: const Duration(milliseconds: 500),
          child: Center(
              child: AppText(
                  text: widget.text,
                  style: widget.style,
                  color: widget.buttoncolor == AppColor.whiteColor
                      ? !_isHovered
                          ? widget.textcolor
                          : AppColor.whiteColor
                      : widget.textcolor,
                  textCenter: true,
                  maxLines: 2,
                  fontsize: widget.textSize,
                  fontWeight: widget.textWeight)),
        ),
      ),
    );
  }
}
