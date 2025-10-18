import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class RRoundedContainer extends StatelessWidget {
  const RRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = RSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = AppColors.backgroundColor,
    this.backgroundColor = AppColors.backgroundColor,
    this.gradient,
    this.padding,
    this.margin,
    this.borderWidth = 1,
  });

  final double? width, height;
  final double radius;
  final double borderWidth;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final LinearGradient? gradient;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: child,
    );
  }
}
