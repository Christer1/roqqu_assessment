import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/common/functions/bottom_sheet.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_risks_modal.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';

class CopyTradingDetails extends StatelessWidget {
  final String name;
  final String roi;
  final String aum;
  final List<double> dataPoints;

  const CopyTradingDetails({
    super.key,
    required this.name,
    required this.roi,
    required this.aum,
    required this.dataPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: AppColors.backgroundColor,
        title: const Text('Trading Details', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(height: RSizes.spaceBtwItems),

                Row(
                  children: [
                    RCircularContainer(
                      showBorder: true,
                      borderColor: Color(0xFF47CD89),
                      width: 50,
                      height: 50,
                      backgroundColor: Color.fromRGBO(71, 205, 137, 0.14),
                      child: Center(child: Text("JI", style: TextStyles.subtitle.copyWith(color: Colors.white, fontSize: 18))),
                    ),

                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: TextStyles.subtitle.copyWith(color: Colors.white, fontSize: 18)),

                        Row(
                          children: [
                            Icon(Icons.people_alt_outlined, color: Color(0xFF85D1F0), size: 16,),
                            SizedBox(width: RSizes.xs),
                            Text('500 Copiers', style: TextStyles.body.copyWith(color: Color(0xFF85D1F0), fontSize: 12)),
                          ],
                        ),
                      ],
                    ),


                  ],
                ),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

                //day, P&L and total orders
                Row(
                  children: [
                      RRoundedContainer(
                        backgroundColor: AppColors.lightBackgroundColor,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        radius: RSizes.cardRadiusXs,
                        child: Text("43 trading days", style: TextStyles.bodySmall.copyWith(color: Color(0xFFA7B1BC))),
                      ),
                      SizedBox(width: RSizes.sm),
                      RRoundedContainer(
                        backgroundColor: AppColors.lightBackgroundColor,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        radius: RSizes.cardRadiusXs,
                        child: Text("15% profit-share", style: TextStyles.bodySmall.copyWith(color: Color(0xFFA7B1BC))),
                      ),
                      SizedBox(width: RSizes.sm),
                      RRoundedContainer(
                        backgroundColor: AppColors.lightBackgroundColor,
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        radius: RSizes.cardRadiusXs,
                        child: Text("56 total orders", style: TextStyles.bodySmall.copyWith(color: Color(0xFFA7B1BC))),
                      ),                      
                  ],
                ),

            const SizedBox(height: RSizes.spaceBtwItems),

            //certified pro trader
            RRoundedContainer(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              backgroundColor: AppColors.lightBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Certified PROtrader",  style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.w700)),
                  SizedBox(height: RSizes.sm),
                  Row(
                    children: [
                      RRoundedContainer(
                        radius: RSizes.cardRadiusXs,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        backgroundColor: Color.fromRGBO(23, 178, 106, 0.08),
                        child: Row(
                          children: [
                            Icon(Icons.insert_chart, color: Color(0xFF17B26A)),
                            SizedBox(width: RSizes.sm),
                            Text("High win rate", style: TextStyles.bodySmall.copyWith(color: Color(0xFF17B26A))),
                          ],
                        ),
                      ),
                      SizedBox(width: RSizes.sm),
                      RRoundedContainer(
                        radius: RSizes.cardRadiusXs,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        backgroundColor: Color.fromRGBO(247, 144, 9, 0.08),
                        child: Row(
                          children: [
                            Icon(Icons.show_chart, color: Color(0xFFF79009)),
                            SizedBox(width: RSizes.sm),
                            Text("Great risk control", style: TextStyles.bodySmall.copyWith(color: Color(0xFFF79009))),
                          ],
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),

             SizedBox(height: RSizes.spaceBtwSections),

            SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(dataPoints.length,
                          (i) => FlSpot(i.toDouble(), dataPoints[i])),
                      isCurved: true,
                      color: const Color.fromARGB(255, 133, 216, 176),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color.fromARGB(255, 121, 172, 147),
                      ),
                      dotData: const FlDotData(show: false),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            RElevatedButtonTheme.gradientButton(
onPressed: () {
  bool isChecked = false; // <-- keep the checkbox state outside the builder

  rShowSelectionSheet(
    context,
    child: StatefulBuilder(
      builder: (context, setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            // Close button (top-right)
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ),
        
            SizedBox(height: RSizes.spaceBtwItems),
            // Illustration
            Image.asset(
              RImages.importantMessage,
              height: 140,
              fit: BoxFit.contain,
            ),
            const SizedBox(height:  RSizes.spaceBtwItems),
        
            // Title
            Text(
              'Important message!',
              style: TextStyles.headline.copyWith(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height:  RSizes.sm),
        
            // Description
            Text(
              "Don't invest unless you're prepared and understand the risks involved in copy trading.",
              style: TextStyles.body.copyWith(color: Colors.grey[300]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height:  RSizes.sm),
        
            // Learn more link
            RichText(
              text: TextSpan(
                text: 'Learn more',
                style: TextStyles.body.copyWith(color: Colors.lightBlueAccent),
                children: [
                  TextSpan(
                    text: ' about the risks.',
                    style: TextStyles.body.copyWith(color: Colors.grey[300]),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 20),
        
            // Checkbox + label
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  activeColor: Colors.lightBlueAccent,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
        
                // Label
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Check this box to agree to Roqqu’s copy trading ',
                      style: TextStyles.bodySmall.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
                      children: [
                        TextSpan(
                          text: 'policy',
                          style: TextStyles.body.copyWith(color: Colors.lightBlueAccent, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        
            const SizedBox(height: 16),
        
            // Proceed button - disabled until checked
            SizedBox(
              width: double.infinity,
              child: AbsorbPointer(
                absorbing: !isChecked,
                child: Opacity(
                  opacity: isChecked ? 1.0 : 0.5,
                  child: RElevatedButtonTheme.gradientButton(
                    onPressed: () {
                      
                      CopyTradingRisksModal.show(context);

                    },
                    text: 'Proceed to copy trade',
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 16),
          ],
        );
      },
    ),
  );
},



              text: 'Copy Trade'
            ),
            SizedBox(height: RSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
