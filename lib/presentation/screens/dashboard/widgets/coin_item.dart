import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/coin_card.dart'; 

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

          RRoundedContainer(
            padding: const EdgeInsets.all(RSizes.sm),
            backgroundColor: AppColors.lightBackgroundColor,
            radius: RSizes.cardRadiusMd,
            child: CoinCard(
              coinName: (coin['symbol'] as String).toLowerCase(),
              width: 40,
              height: 40,
              size: 20,
            ),
          ),
          const SizedBox(width: RSizes.md),

          // Coin Name and Symbol
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coin['name'] as String? ?? '',
                  style: RTextStyle.body.copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: RSizes.xs),
                Text(
                  coin['symbol'] as String? ?? '',
                  style: RTextStyle.body.copyWith(
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
                coin['price'] as String? ?? '',
                style: RTextStyle.body.copyWith(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: RSizes.xs),
              Text(
                coin['change'] as String? ?? '',
                style: RTextStyle.body.copyWith(
                  color: (coin['isPositive'] as bool? ?? true)
                      ? Colors.green
                      : Colors.red,
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
