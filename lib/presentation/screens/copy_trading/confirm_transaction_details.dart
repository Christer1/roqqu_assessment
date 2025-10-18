import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';
import 'confirmation_pin_section.dart';

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
    final double netAmount = double.parse(amount) - double.parse(fee);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title:  Text('Confirm transaction', style: TextStyles.body.copyWith(color: Colors.white, fontSize: 16)),

        backgroundColor: AppColors.backgroundColor,
        leading: const BackButton(color: Colors.white),
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
                        TextStyles.bodySmall.copyWith(color: Color(0xFFA7B1BC)),
                  ),
                  const SizedBox(height: RSizes.sm * 0.5),
                  Text(
                    "$amount USD",
                    style: TextStyles.headline.copyWith(
                        color: Colors.white),
                  ),
                  const SizedBox(height: RSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("PRO trader",
                          style: TextStyles.bodySmall
                              .copyWith(color: Color(0XFFA7B1BC))),
                      Text("BTC master",
                          style: TextStyles.bodySmall
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: RSizes.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("What you get",
                          style: TextStyles.bodySmall
                              .copyWith(color: Color(0XFFA7B1BC))),
                      Text("99 USD",
                          style: TextStyles.bodySmall
                              .copyWith(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(height: RSizes.md),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Transaction Fee",
                          style: TextStyles.bodySmall
                              .copyWith(color: Color(0XFFA7B1BC))),
                      Text("1.00 USD",
                          style: TextStyles.bodySmall
                              .copyWith(color: Colors.white)),
                    ],
                  ),                  
                ],
              ),
            ),
            const Spacer(),
            RElevatedButtonTheme.gradientButton(
              text: "Confirm transaction",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ConfirmationPinSection()),
                );
              },
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
