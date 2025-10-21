import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/routes/route_helper.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';

class ConfirmTransactionDetails extends StatelessWidget {
  final String amount;
  final String fee;

  const ConfirmTransactionDetails({
    super.key,
    required this.amount,
    required this.fee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title:  Text('Confirm transaction', style: RTextStyle.body.copyWith(color: AppColors.whiteColor, fontSize: 16)),

        backgroundColor: AppColors.backgroundColor,
        leading: const BackButton(color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: RSizes.spaceBtwSections),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.lightBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage(RImages.usFlag),
                    radius: RSizes.cardRadiusMd * 2,
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  Text(
                    "Copy trading amount",
                    style:
                        RTextStyle.bodySmall.copyWith(color: AppColors.greyColor),
                  ),
                  const SizedBox(height: RSizes.sm * 0.5),
                  Text(
                    "$amount USD",
                    style: RTextStyle.headline.copyWith(
                        color: AppColors.whiteColor),
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PRO trader",
                          style: RTextStyle.bodySmall
                              .copyWith(color: AppColors.greyColor)),
                      Text("BTC master",
                          style: RTextStyle.bodySmall
                              .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                  const SizedBox(height: RSizes.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("What you get",
                          style: RTextStyle.bodySmall
                              .copyWith(color: AppColors.greyColor)),
                      Text("99 USD",
                          style: RTextStyle.bodySmall
                              .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),
                  const SizedBox(height: RSizes.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transaction Fee",
                          style: RTextStyle.bodySmall
                              .copyWith(color: AppColors.greyColor)),
                      Text("1.00 USD",
                          style: RTextStyle.bodySmall
                              .copyWith(color: AppColors.whiteColor)),
                    ],
                  ),                  
                ],
              ),
            ),
            const Spacer(),
            RElevatedButtonTheme.gradientButton(
              text: "Confirm transaction",
              onPressed: () {
                Get.toNamed(RRouteHelper.confirmTransactionPin);
              },
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
