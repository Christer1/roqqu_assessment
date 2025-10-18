import 'package:flutter/material.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/widgets/coin_item.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class ListCoinSection extends StatelessWidget {
  const ListCoinSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final coins = [
      {
        'name': 'Bitcoin',
        'symbol': 'BTC',
        'price': '\$22,840',
        'change': '-0.61%',
        'isPositive': false,
        'icon': '₿', // You can replace with actual icons or images
      },
      {
        'name': 'Ethereum',
        'symbol': 'ETH',
        'price': '\$0.36',
        'change': '-0.61%',
        'isPositive': false,
        'icon': 'Ξ', // You can replace with actual icons or images
      },
      {
        'name': 'Binance Coin',
        'symbol': 'BNB',
        'price': '\$305.20',
        'change': '+1.25%',
        'isPositive': true,
        'icon': '⎈',
      },
      {
        'name': 'Cardano',
        'symbol': 'ADA',
        'price': '\$0.38',
        'change': '-0.45%',
        'isPositive': false,
        'icon': 'A',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RSizes.md),
      child: Column(
        children: [
          // Section Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Listed Coins',
                style: TextStyles.body.copyWith(
                  color: Color(0xFFA7B1BC),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
              ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Text(
                  'See all',
                  style: TextStyles.body.copyWith(
                  color: Color(0xFF85D1F0),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),  
          const SizedBox(height: RSizes.md),     
          // Coins List
          ListView.separated(
            padding: EdgeInsets.zero, // Important: remove default padding
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: coins.length,
            separatorBuilder: (context, index) => const SizedBox(height: RSizes.md),
            itemBuilder: (context, index) {
              final coin = coins[index];
              return CoinItem(coin: coin);
            },
          ),
        ],
      ),
    );
  }
}

