import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/controllers/crypto_controller.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/coin_item.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/common/widgets/shimmer_effect.dart';

class ListCoinSection extends StatelessWidget {
  const ListCoinSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CryptoController>();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: RSizes.md),
      child: Column(
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Listed Coins',
                style: RTextStyle.body.copyWith(
                  color: const Color(0xFFA7B1BC),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: RTextStyle.body.copyWith(
                    color: const Color(0xFF85D1F0),
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: RSizes.md),

          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.coins.length,
            separatorBuilder: (_, __) => const SizedBox(height: RSizes.md),
            itemBuilder: (context, index) {
              final coin = controller.coins[index];
              final symbol = coin['symbol'] as String;
              
              return Obx(() {
                // Access the reactive map directly
                final coinData = controller.coinPrices[symbol];
                
                // Show shimmer if no data for this coin
                if (coinData == null) {
                  return _buildCoinShimmer();
                }

                final short = coin['short'] as String;
                final price = coinData['price'] ?? 0.0;
                final change = coinData['change'] ?? 0.0;
                final isPositive = coinData['isPositive'] ?? true;

                final coinItemData = {
                  'name': coin['name'],
                  'symbol': symbol.replaceAll('USDT', ''),
                  'price': '\$${price.toStringAsFixed(2)}',
                  'change': '${change.toStringAsFixed(2)}%',
                  'isPositive': isPositive,
                  'icon': controller.getCoinIconUrl(short),
                };

                return CoinItem(coin: coinItemData);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCoinShimmer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2328),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Icon shimmer
          RShimmerEffect(
            width: 40,
            height: 40,
            radius: 20,
          ),
          const SizedBox(width: 12),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name shimmer
                RShimmerEffect(
                  width: 100,
                  height: 16,
                  radius: 4,
                ),
                const SizedBox(height: 4),
                // Symbol shimmer
                RShimmerEffect(
                  width: 60,
                  height: 14,
                  radius: 4,
                ),
              ],
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Price shimmer
              RShimmerEffect(
                width: 80,
                height: 16,
                radius: 4,
              ),
              const SizedBox(height: 4),
              // Change shimmer
              RShimmerEffect(
                width: 60,
                height: 14,
                radius: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}