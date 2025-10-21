
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {'label': 'Deposit', 'img': RImages.deposit},
      {'label': 'Buy', 'img':  RImages.buy},
      {'label': 'Withdraw', 'img':  RImages.withdraw},
      {'label': 'Sell', 'img':  RImages.send},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          RRoundedContainer(
            backgroundColor: AppColors.lightBackgroundColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buttons
                  .map(
                    (btn) => Column(
                      children: [
                        CircleAvatar(
                          radius: 26,
                          backgroundColor: AppColors.backgroundColor,
                          child: Image.asset(btn['img']!),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          btn['label'] as String,
                          style:  TextStyle(fontSize: 12, color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.lightBackgroundColor,
              borderRadius: BorderRadiusGeometry.only(bottomLeft: Radius.circular(RSizes.cardRadiusSm), bottomRight: Radius.circular(RSizes.cardRadiusSm))

            ),
            child: Text("See more", style: RTextStyle.bodySmall.copyWith(color: AppColors.blueColor),),
          ),
        ],
      ),
    );
  }
}