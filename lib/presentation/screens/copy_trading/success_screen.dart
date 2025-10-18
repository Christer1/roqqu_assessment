import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';
import '../crypto_dashboard/crypto_dashboard_screen.dart'; 

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              "assets/images/success_check.png", 
              height: 80,
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            Text(
              "Trade copied successfully",
              style: TextStyles.headline.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: RSizes.sm),
            Text(
              "You have successfully copied BTC Master’s trade.",
              style: TextStyles.body.copyWith(color: Colors.grey[400]),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            RElevatedButtonTheme.gradientButton(
              text: "Go to dashboard",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const CryptoDashboardScreen()),
                  (route) => false,
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
