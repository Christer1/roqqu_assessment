import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/routes/route_helper.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';

class CopyTradingRisk extends StatelessWidget {
  const CopyTradingRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Copy trading', style: TextStyle(color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: RSizes.spaceBtwSections),
            const Text(
              'What risk level are you comfortable exploring?',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: RSizes.sm),
            const Text(
              'Choose a level',
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: RSizes.spaceBtwItems),

            const SizedBox(height: RSizes.spaceBtwItems),
            _buildRiskOption(
              isSelected: true,
              title: 'Conservative profile',
              description:
                  'Involves stable returns from proven strategies with minimal volatility.',
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildRiskOption(
              title: 'Steady growth profile',
              description:
                  'Balanced gains with moderate fluctuations in strategy performance.',
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildRiskOption(
              title: 'Exponential growth profile',
              description:
                  'Potential for significant gains or losses due to aggressive trading and market exposure.',
            ),
            const Spacer(),
            RElevatedButtonTheme.gradientButton(
              onPressed: () {
                Get.toNamed(RRouteHelper.copyTradingDashboard);
              },
              text: 'Proceed',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskOption({required String title, required String description, bool isSelected = false}) {
    return RRoundedContainer(
      showBorder: isSelected ? true : false,
      borderColor: isSelected ? AppColors.blueColor : Colors.transparent,
      borderWidth: isSelected ? 2 : 0,
      width: double.infinity,
      padding: const EdgeInsets.all(RSizes.gridViewSpacing),
      backgroundColor: AppColors.lightBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
