import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class CopyTradingCard extends StatelessWidget {
  const CopyTradingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RSizes.md, vertical: RSizes.md),
      child: RRoundedContainer(
        padding: const EdgeInsets.all(RSizes.md),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF6179FA),
            Color(0xFF98AAFE),
            Color(0xFFFEC536),
          ],
          transform: GradientRotation(40 * (3.14 / 80)),
        ),
        radius: RSizes.cardRadiusLg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              'Copy Trading',
              style: TextStyles.body.copyWith(
                color: Colors.black,
                fontSize: 16, 
                fontWeight: FontWeight.w700,
              ),
            ),            
            // Description
            Text(
              'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! \nWe are rooting for you!',
              style: TextStyles.body.copyWith(
                color: Colors.black,
                fontSize: 12,
              ),
            ),        
          ],
        ),
      ),
    );
  }
}