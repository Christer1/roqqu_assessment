import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class CarouselCards extends StatelessWidget {
  const CarouselCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cards = [
      {
        'title': 'Delisting coins',
        'description': 'View the list of coins we are delisting',
        'borderColor': const Color(0xFF2D2D3D),
      },
      {
        'title': 'Urgent Notice',
        'description': 'Important updates and announcements',
        'borderColor': const Color(0xFF2D2D3D),
      },
      {
        'title': 'New Listings',
        'description': 'Check out our newly added coins',
        'borderColor': const Color(0xFF2D2D3D),
      },
    ];

    return SizedBox(
      height: 80, // Fixed height for carousel
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: RSizes.md),
        itemCount: cards.length,
        itemBuilder: (context, index) {
          final card = cards[index];
          return Container(
            width: 280, // Fixed width for each card
            margin: EdgeInsets.only(
              right: index == cards.length - 1 ? 0 : RSizes.md,
            ),
            child: RRoundedContainer(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.symmetric(horizontal: RSizes.md, vertical: RSizes.md / 2),
              backgroundColor: AppColors.lightBackgroundColor,
              radius: RSizes.cardRadiusLg,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon
                  const Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(width: RSizes.md),
                  
                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Title
                        Text(
                          card['title'] as String,
                          style: RTextStyle.body.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: RSizes.xs),
                        
                        // Description
                        Text(
                          card['description'] as String,
                          style: RTextStyle.body.copyWith(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



