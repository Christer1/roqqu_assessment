import 'package:flutter/material.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';

class RCircularContainer extends StatelessWidget {
  const RCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = AppColors.backgroundColor,
    this.margin,
    this.showBorder = false, //Default to false
    this.borderColor,
    this.borderWidth,
  });

  final double? width, height;
  final double radius, padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  // New optional border properties
  final bool showBorder;
  final Color? borderColor;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: showBorder
            ? Border.all(
                color: borderColor ?? Colors.grey, // Default border color
                width: borderWidth ?? 1.0,         // Default border width
              )
            : null, // No border if showBorder is false
      ),
      child: child,
    );
  }
}
