import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/controllers/balance_controller.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class BalanceSectionWidget extends StatelessWidget {
  const BalanceSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BalanceController balanceController = Get.find<BalanceController>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your GBP Balance',
                style: RTextStyle.body.copyWith(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Obx(() => GestureDetector(
                onTap: balanceController.toggleBalanceVisibility,
                child: Icon(
                  balanceController.getBalanceIcon(),
                  color: Colors.white70,
                  size: 16,
                ),
              )),
            ],
          ),
          const SizedBox(height: RSizes.sm),
          
          Obx(() => Text(
            balanceController.getDisplayBalance(),
            style: RTextStyle.body.copyWith(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          )),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}