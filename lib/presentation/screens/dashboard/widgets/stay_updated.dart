
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class StayUpdated extends StatelessWidget {
  const StayUpdated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Stay Updated',
              style: RTextStyle.body.copyWith(
                color: AppColors.greyColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: RSizes.md),
        ],
      ),
    );
  }
}