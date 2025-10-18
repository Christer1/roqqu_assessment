import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';
import 'copy_trading_dashboard.dart';

class CopyTradingRisk extends StatelessWidget {
  const CopyTradingRisk({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Copy trading', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
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
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: RSizes.sm),
            const Text(
              'Choose a level',
              style: TextStyle(
                color: Color(0xFFA7B1BC),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CopyTradingDashboard()),
                );
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
      borderColor: isSelected ? Color(0xFF85D1F0) : Colors.transparent,
      borderWidth: isSelected ? 2 : 0,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      backgroundColor: AppColors.lightBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  color: Colors.white,
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
