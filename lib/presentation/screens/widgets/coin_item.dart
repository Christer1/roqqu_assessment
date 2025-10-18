import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class CoinItem extends StatelessWidget {
  const CoinItem({
    super.key,
    required this.coin,
  });

  final Map<String, dynamic> coin;

  @override
  Widget build(BuildContext context) {
    return RRoundedContainer(
      padding: const EdgeInsets.all(RSizes.lg),
      backgroundColor: AppColors.lightBackgroundColor,
      radius: RSizes.cardRadiusLg,
      child: Row(
        children: [
          // Coin Icon/Logo
          RRoundedContainer(
            padding: const EdgeInsets.all(RSizes.sm),
            backgroundColor: AppColors.backgroundColor,
            radius: RSizes.cardRadiusMd,
            child: Text(
              coin['icon'] as String,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: RSizes.md),
          
          // Coin Name and Symbol
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin['name'] as String,
                  style: TextStyles.body.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: RSizes.xs),
                Text(
                  coin['symbol'] as String,
                  style: TextStyles.body.copyWith(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          
          // Price and Change
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                coin['price'] as String,
                style: TextStyles.body.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: RSizes.xs),
              Text(
                coin['change'] as String,
                style: TextStyles.body.copyWith(
                  color: coin['isPositive'] as bool ? Colors.green : Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


