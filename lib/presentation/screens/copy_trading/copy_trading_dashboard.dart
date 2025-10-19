import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copier_dashboard.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/widgets/profile_badge.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/min_line_chart.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'copy_trading_details.dart';

class CopyTradingDashboard extends StatelessWidget {
  const CopyTradingDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final traders = [
      {
        'name': 'Jay Isikou',
        'roi': '+120.42%',
        'aum': '36,487.29',
        'data': [0.2, 0.8, 0.4, 1.5, 0.4, 0.3],
      },
      {
        'name': 'Laura Okobi',
        'roi': '+94.42%',
        'aum': '28,874.20',
        'data': [0.2, 0.8, 0.4, 1.5, 0.4, 0.3],
      },
      {
        'name': 'BTC Master',
        'roi': '+102.40%',
        'aum': '35,027.63',
        'data': [0.2, 0.8, 0.4, 1.5, 0.4, 0.3],
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: AppColors.backgroundColor,
        title:  Text('Copy Trading', style: TextStyles.body.copyWith(color: Colors.white, fontSize: 16)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(RSizes.gridViewSpacing),
        child: Column(
          children: [
            SizedBox(height: RSizes.spaceBtwItems),
            Row(
              children: [
                _buildDashboardCard(
                  context,
                  const LinearGradient(
                    colors: [Color(0xFFABE2F3), Color(0xFFBDE4E5), Color(0xFFEBE9D0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  Image.asset(RImages.proTrader),
                  'My Dashboard',
                  'View trades',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  CopierDashboard(),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 10),
                _buildDashboardCard(context, LinearGradient(

              colors: [Color(0xFFC0CFFE), Color(0xFFF3DFF4), Color(0xFFF9D8E5)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ), 
            Image.asset(RImages.copyTradingIcon),
            'Become a PRO trader', 
            'Apply now',
            null),
              ],
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'PRO Traders',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(height: RSizes.xs),
            Expanded(
              child: ListView.builder(
                itemCount: traders.length,
                itemBuilder: (context, index) {
                  final trader = traders[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CopyTradingDetails(
                            name: trader['name'] as String,
                            roi: trader['roi'] as String,
                            aum: trader['aum'] as String,
                            dataPoints: trader['data'] as List<double>,
                          ),
                        ),
                      );
                    },
                    child: _buildTraderCard(
                      name: trader['name'] as String,
                      roi: trader['roi'] as String,
                      aum: trader['aum'] as String,
                      dataPoints: trader['data'] as List<double>,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, LinearGradient gradient, Image image, String title, String subtitle, GestureTapCallback? ontap) {
    return Expanded(
      child: GestureDetector(
       
       onTap: ontap,
       
        child: RRoundedContainer(
          padding: const EdgeInsets.all(RSizes.gridViewSpacing),
         gradient: gradient,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RCircularContainer(
                width: 40,
                height: 40,
                backgroundColor: AppColors.backgroundColor,
                child: image,
              ),
              SizedBox(height: RSizes.spaceBtwItems),
              Text(title, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12)),
              const SizedBox(height: RSizes.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(subtitle, style: const TextStyle(color: Color(0xFF20252B), fontWeight: FontWeight.w400, fontSize: 12)),
                  Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTraderCard({
    required String name,
    required String roi,
    required String aum,
    required List<double> dataPoints,
  }) {
        return RRoundedContainer(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(RSizes.gridViewSpacing),
      backgroundColor: AppColors.lightBackgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              RProfileBadge(
                width: 40,
                height: 40,
                backgroundColor: AppColors.lightBackgroundColor,
                borderColor: const Color(0xFF5283FF),
                text: "JI",
                textFontSize: 16, // you can adjust this if needed
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyles.body.copyWith(color: Colors.white)),

                  Row(
                    children: [
                      Icon(Icons.people_alt_outlined, color: AppColors.blueColor, size: 16,),
                      SizedBox(width: RSizes.xs),
                      Text('500', style: TextStyles.body.copyWith(color: AppColors.blueColor)),
                    ],
                  ),
                ],
              ),
              Spacer(),
              RRoundedContainer(
                radius: RSizes.cardRadiusXs,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                backgroundColor: AppColors.backgroundColor,
                child: Text('Copy', style: TextStyles.body.copyWith(color: AppColors.greyColor)),
              ),

            ],
          ),
          SizedBox(height: RSizes.sm),

          Divider(
            thickness: 2,
            color: Color(0xFF262932),
          ),
          SizedBox(height: RSizes.spaceBtwItems),

          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ROI", style: TextStyles.body.copyWith(color: AppColors.greyColor)),

                  Text("+120.42%", style: TextStyles.subtitle.copyWith(color: AppColors.greenColor)),

                  Row(
                    children: [
                      Text("Total PNL: ", style: TextStyles.body.copyWith(color: AppColors.greenColor)),
                      Text("\$38,667.24", style: TextStyles.subtitle.copyWith(color: Colors.white)),
                    ],
                  ),

                ],
              ),
              Spacer(),
              MiniLineChart(dataPoints: dataPoints),
            ],
          ),


          SizedBox(height: RSizes.sm),
          
          Divider(
            thickness: 2,
            color: Color(0xFF262932),
          ),
          SizedBox(height: RSizes.spaceBtwItems),

          RRoundedContainer(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            backgroundColor: AppColors.backgroundColor,
            radius: 0,
            child: Row(
              children: [
                Row(
                  children: [
                    Text("Win rate: ", style: TextStyles.body.copyWith(color: AppColors.greyColor),),
                    Text("100%", style: TextStyles.subtitle.copyWith(color: Colors.white),),
                  ],
                ),
                Spacer(),

                Row(
                  children: [
                    Icon(Icons.error_outline_outlined, color: AppColors.greyColor, size: 14,),
                    SizedBox(width: RSizes.xs * 0.5),
                    Text("AUM: ", style: TextStyles.body.copyWith(color: AppColors.greyColor),),
                    Text("38,667.29%", style: TextStyles.subtitle.copyWith(color: Colors.white),),
                  ],
                )                
              ],
            ),
          )
        ],
      ),
    );
  }
}
