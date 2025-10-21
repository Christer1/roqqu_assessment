import 'package:flutter/material.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';

class PlaceholderPage extends StatelessWidget {
  final String title;
  
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundColor,
      child: Center(
        child: Text(
          '$title Page',
          style: RTextStyle.body.copyWith(color: AppColors.whiteColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}