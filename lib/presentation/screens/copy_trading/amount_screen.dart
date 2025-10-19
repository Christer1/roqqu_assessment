import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/confirm_transaction_details.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';


class AmountScreen extends StatefulWidget {
  const AmountScreen({super.key});

  @override
  State<AmountScreen> createState() => _AmountScreenState();
}

class _AmountScreenState extends State<AmountScreen> {
  final TextEditingController _controller = TextEditingController();
  double fee = 0.0;

  void _onAmountChanged(String value) {
    setState(() {
      double parsed = double.tryParse(value) ?? 0;
      fee = parsed * 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title:  Text("Enter amount",
            style: TextStyles.body.copyWith(color: Colors.white, fontSize: 16)),

        backgroundColor: AppColors.backgroundColor,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: RSizes.spaceBtwSections * 2),

            // Input Field
            TextField(
              controller: _controller,
              onChanged: _onAmountChanged,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(
                hintText: "0 USD",
                hintStyle: TextStyles.headline.copyWith(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 40),
                border: InputBorder.none,
              ),
            ),

            const SizedBox(height: RSizes.spaceBtwItems),
            RRoundedContainer(
              radius: RSizes.cardRadiusXs,
              padding: EdgeInsets.symmetric(vertical:  10, horizontal: 20),
              backgroundColor: AppColors.lightBackgroundColor,
              child: Text(
                "Transaction fee (1%) - ${fee.toStringAsFixed(2)} USD",
                style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),

            const Spacer(),

            // USD Balance + Use Max container
            RRoundedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              backgroundColor: AppColors.lightBackgroundColor,
              radius: RSizes.cardRadiusSm,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "USD Balance",
                        style: TextStyles.body.copyWith(
                          color: AppColors.greyColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        '\$240.73',
                        style: TextStyles.body.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _controller.text = "240.73";
                        _onAmountChanged("240.73");
                      });
                    },
                    child: RRoundedContainer(
                      padding: EdgeInsets.all(10),
                      backgroundColor: AppColors.backgroundColor,
                      radius: RSizes.cardRadiusMd,
                      child: const Text(
                        "Use Max",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: RSizes.spaceBtwSections * 1.2),

            // Gradient Button
            RElevatedButtonTheme.gradientButton(
              text: "Continue",
              onPressed: _controller.text.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ConfirmTransactionDetails(
                            amount: _controller.text,
                            fee: fee.toStringAsFixed(2),
                          ),
                        ),
                      );
                    },
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
