import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class CopyTradingCard extends StatelessWidget {
  const CopyTradingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RSizes.md, vertical: RSizes.md),
      child: Stack(
        children:
        
        [

         Positioned(
           child: RRoundedContainer(
            width: double.infinity,
            padding: const EdgeInsets.all(RSizes.md),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(171, 226, 243, 1),
                Color.fromRGBO(189, 228, 229, 1),
                Color.fromRGBO(235, 233, 208, 1),
              ],
              transform: GradientRotation(40 * (0.20 / 80)),
            ),
            radius: RSizes.cardRadiusLg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Copy Trading',
                  style: RTextStyle.body.copyWith(
                    color: Colors.black,
                    fontSize: 16, 
                    fontWeight: FontWeight.w700,
                  ),
                ),            
                // Description
                Text(
                  'Discover our latest feature. Follow and watch \n the PRO traders closely and win like a PRO! \nWe are rooting for you!',
                  style: RTextStyle.bodySmall.copyWith(
                    color: Color(0xFF1C2127),
                    fontSize: 12,
                  ),
                ),        
              ],
            ),
                   ),
         ),

          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(RImages.crown
            ))

        ]
        

      ),
    );
  }
}