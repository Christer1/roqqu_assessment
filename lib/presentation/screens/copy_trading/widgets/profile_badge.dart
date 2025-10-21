import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';

class RProfileBadge extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final double textFontSize;
  final Color textColor;
  final bool showBorder;

  const RProfileBadge({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textFontSize,
    this.textColor = AppColors.whiteColor,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return RCircularContainer(
      showBorder: showBorder,
      borderColor: borderColor,
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      child: Center(
        child: Text(
          text,
          style: RTextStyle.subtitle.copyWith(
            color: textColor,
            fontSize: textFontSize,
          ),
        ),
      ),
    );
  }
}
