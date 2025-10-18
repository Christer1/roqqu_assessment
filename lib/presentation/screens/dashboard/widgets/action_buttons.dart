
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final buttons = [
      {'label': 'Deposit', 'icon': Icons.account_balance_wallet_outlined},
      {'label': 'Buy', 'icon': Icons.shopping_bag_outlined},
      {'label': 'Withdraw', 'icon': Icons.arrow_circle_up_outlined},
      {'label': 'Sell', 'icon': Icons.attach_money},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RRoundedContainer(
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
                      child: Icon(btn['icon'] as IconData,
                          color: Colors.white, size: 22),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      btn['label'] as String,
                      style: const TextStyle(fontSize: 12, color: Colors.white70),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}