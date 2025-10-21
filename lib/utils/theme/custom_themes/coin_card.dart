import 'package:cryptofont/cryptofont.dart' as crypto_fonts;
import 'package:flutter/material.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/circular_icon.dart';

class CoinCard extends StatelessWidget {
  final String coinName;
  final double width;
  final double height;
  final double size;

  const CoinCard({
    super.key,
    required this.coinName,
    this.width = 45,
    this.height = 45,
    this.size = 25,
  });

  List<dynamic> getCoin() {
    switch (coinName.toLowerCase()) {
      case 'eth':
        return [crypto_fonts.CryptoFontIcons.eth, Colors.blueAccent];
      case 'btc':
        return [crypto_fonts.CryptoFontIcons.btc, Colors.orange];
      case 'usdt':
        return [crypto_fonts.CryptoFontIcons.usdt, Colors.green];
      case 'sol':
        return [crypto_fonts.CryptoFontIcons.sol, Colors.purple];
      case 'bnb':
        return [crypto_fonts.CryptoFontIcons.bnb, const Color.fromARGB(255, 0, 157, 255)];
      case 'ada':
        return [crypto_fonts.CryptoFontIcons.ada, Colors.blueGrey];
      default:
        return [crypto_fonts.CryptoFontIcons.btc, Colors.orange];
    }
  }

  @override
  Widget build(BuildContext context) {
    final coin = getCoin();
    return RCircularIcon(
      width: width,
      height: height,
      size: size,
      color: AppColors.whiteColor,
      icon: coin[0],
      backgroundColor: coin[1],
    );
  }
}
