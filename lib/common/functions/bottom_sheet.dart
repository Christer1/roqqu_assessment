import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

rShowSelectionSheet(
  BuildContext context, {
  double heightFactor = 0.6,
  required Widget child,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (_) {
      return RRoundedContainer(
        backgroundColor: AppColors.backgroundColor,
        child: FractionallySizedBox(
          heightFactor: heightFactor,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: RSizes.defaultSpace,
              ),
              child: child,
            ),
          ),
        ),
      );
    },
  );
}
