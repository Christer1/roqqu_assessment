
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/routes/route_helper.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class ConfirmationPinSection extends StatefulWidget {
  const ConfirmationPinSection({super.key});

  @override
  State<ConfirmationPinSection> createState() => _ConfirmationPinSectionState();
}

class _ConfirmationPinSectionState extends State<ConfirmationPinSection> {
  String pin = "";

void onTap(String value, BuildContext context) {
  setState(() {
    if (value == '←') {
      if (pin.isNotEmpty) pin = pin.substring(0, pin.length - 1);
    } else if (pin.length < 6) {
      pin += value;
    }
  });
  
  // Check pin length after setState completes
  if (pin.length == 6) {
    Future.delayed(const Duration(milliseconds: 400), () {
      Get.toNamed(RRouteHelper.successScreen);
    });
  }
}


  @override
  Widget build(BuildContext context) {
    final buttons = [
      '1', '2', '3',
      '4', '5', '6',
      '7', '8', '9',
      '.', '0', '←',
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Confirm transaction",
            style: TextStyle(color: AppColors.whiteColor, fontSize: 16)),
        backgroundColor: AppColors.backgroundColor,
        leading: const BackButton(color: AppColors.whiteColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: RSizes.spaceBtwSections),
             Image.asset(RImages.passwordLock, height: 32),
            const SizedBox(height: RSizes.sm),
            Text(
              "Confirm Transaction",
              style: RTextStyle.headline.copyWith(
                  color: AppColors.whiteColor),
            ),
            const SizedBox(height: RSizes.sm),
            Text(
              "Input your 6 digit transaction PIN to confirm your transaction and authenticate your request",
              style: RTextStyle.body.copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            // PIN dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    6,
                    (index) => Container(
                      width: 13,
                      height: 14,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index < pin.length
                            ? AppColors.whiteColor
                            : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: RSizes.sm),
                Image.asset(RImages.biometric),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            // Numpad
            Expanded(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisExtent: 70,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (_, index) {
                  final key = buttons[index];
                  return InkWell(
                    onTap: () => onTap(key, context),
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: Text(
                        key,
                        style: const TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: RSizes.sm),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot PIN?",
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
