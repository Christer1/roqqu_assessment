import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/helpers/helper_functions.dart';

class CopierDashboard extends StatelessWidget {

  const CopierDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: const BackButton(color: AppColors.whiteColor),
          title: Text(
            'My Dashobard',
            style: RTextStyle.subtitle.copyWith(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Column(
          children: [
            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(RSizes.gridViewSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTraderHeader(),
                    const SizedBox(height: RSizes.spaceBtwItems),

                    // Tab bar view
                    RRoundedContainer(
                      radius: RSizes.cardRadiusXs,
                      backgroundColor: Color.fromARGB(255, 24, 29, 35),
                      padding: EdgeInsets.all(0),
                      child: const TabBar(
                        labelPadding: EdgeInsets.all(0),
                        dividerColor: Colors.transparent,
                        indicatorWeight: 0.5,
                        indicatorColor: AppColors.blueColor,
                        labelColor: AppColors.whiteColor,
                        unselectedLabelColor: AppColors.greyColor,
                        tabs: [
                          Tab(text: 'Chart'),
                          Tab(text: 'Cur. Trades'),
                          Tab(text: 'Stats'),
                          Tab(text: 'My Traders'),
                        ],
                      ),
                    ),
                  //tab view
                  SizedBox(
                    height: RHelperFunctions.screenHeight() * 0.8,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(child: _buildChartTab(context)),
                        SingleChildScrollView(child: _buildCurrentTradesTab(context)),
                        SingleChildScrollView(child: _buildStatsTab(context)),
                        SingleChildScrollView(child: _buildCopiersTab(context)),
                      ],
                    ),
                  ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Chart Tab ---
Widget _buildChartTab(BuildContext context) {
  final dataPoints = [0.2, 0.8, 0.4, 1.5, 0.4, 0.3];

  return Padding(
    padding: const EdgeInsets.only(top: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: List.generate(
                    dataPoints.length,
                    (i) => FlSpot(i.toDouble(), dataPoints[i]),
                  ),
                  isCurved: true,
                  color: const Color(0xFF00FF85),
                  barWidth: 3,
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromRGBO(0, 255, 133, 0.3),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  dotData: const FlDotData(show: false),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: RSizes.spaceBtwSections),
        Text("Trading History", style: RTextStyle.bodySmall.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.w700),),
        _buildCurrentTradesTab(context)
      ],
    ),
  );
}


  // --- Stats Tab ---
  Widget _buildStatsTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RRoundedContainer(
            radius: RSizes.cardRadiusXs,
            backgroundColor: AppColors.lightBackgroundColor,
            padding: EdgeInsets.all(RSizes.gridViewSpacing),
            margin: EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trading statistics',
                    style: RTextStyle.bodySmall.copyWith(
                        color: AppColors.whiteColor, fontWeight: FontWeight.w700)),
                SizedBox(height: RSizes.sm),                    
                const SizedBox(height: RSizes.sm),
                _statItem('PRO traders', '17', AppColors.blueColor),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                _statItem('Trading days', '43', AppColors.whiteColor),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                _statItem('Profit share', '15%', AppColors.whiteColor),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                _statItem('Total Order', '56 USDT', AppColors.whiteColor),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                _statItem('Average losses', '0 USDT', Colors.red),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                _statItem('Total copy trades', '72', AppColors.whiteColor),                
              ],
            ),
          ),



          const SizedBox(height: RSizes.xs),
          RRoundedContainer(
            radius: RSizes.cardRadiusXs,
            width: double.infinity,
              padding: EdgeInsets.all(20),
            backgroundColor: AppColors.lightBackgroundColor,            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Trading pairs',
                    style: RTextStyle.bodySmall.copyWith(
                        color: AppColors.whiteColor, fontWeight: FontWeight.w700)),

                  const SizedBox(height: RSizes.sm),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      'BTCUSDT',
                      'ETHUSDT',
                      'XRPUSDT',
                      'TIAUSDT',
                      'DOGEUSDT',
                      'PERPUSDT',
                      'TIAUSDT',
                      'DOGEUSDT',
                      'PERPUSDT',                      
                    ]
                        .map((pair) => RRoundedContainer(
                              radius: RSizes.cardRadiusXs,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 7),
                              backgroundColor: AppColors.backgroundColor,
                              child: Text(pair,
                                  style: RTextStyle.body
                                      .copyWith(color: AppColors.greyColor)),
                            ))
                        .toList(),
                  ),
              ],
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwSections),

        ],
      ),
    );
  }

  // --- All Trades Tab ---
  Widget _buildCurrentTradesTab(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RRoundedContainer(
              radius: 0,
              backgroundColor:AppColors.lightBackgroundColor,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset(RImages.btc),
                  SizedBox(width: RSizes.sm),
                  Text('BTCUSDT',
                      style: RTextStyle.subtitle
                          .copyWith(color: AppColors.greyColor)),
              
                              Text(' - 10X',
                      style: RTextStyle.subtitle
                          .copyWith(color: AppColors.blueColor, fontSize: 16)),
              Spacer(),
              Text('+3.28% ROI',
                  style: RTextStyle.body
                      .copyWith(color: AppColors.greenColor, fontWeight: FontWeight.w500)),
              ],
              ),
            ),



            const SizedBox(height: RSizes.sm),
            _tradeDetail('PRO Trader', 'BTC Master', showImg:  true),
            SizedBox(height: RSizes.md),
            _tradeDetail('Entry price', '1.9661 USDT'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Market price', '1.9728 USDT'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Exit time', '01:22 PM'),
            SizedBox(height: RSizes.md), 
          ],
        );
      },
    );
  }

  // --- Copiers Tab ---
Widget _buildCopiersTab(BuildContext context) {
  final  copiers = [
  {
    "name": "Jaykay Kayode",
    "initials": "JK",
    "color": const Color(0xFF2E66F6),
    "borderColor": const Color.fromRGBO(46, 102, 246, 0.15),
  },
  {
    "name": "Okobi Laura",
    "initials": "OL",
    "color": const Color(0xFFF6A22E),
    "borderColor": const Color.fromRGBO(246, 162, 46, 0.15),
  },
  {
    "name": "Tosin Lasisi",
    "initials": "TL",
    "color": const Color(0xFF2EC4F6),
    "borderColor": const Color.fromRGBO(46, 196, 246, 0.15),
  },

  ];

  return RRoundedContainer(
    backgroundColor: AppColors.backgroundColor,
    padding: EdgeInsets.symmetric(horizontal:  16, vertical: 8),
    child: Column(
      children: [
        // Search bar
        RRoundedContainer(
            backgroundColor: AppColors.lightBackgroundColor,
            radius: RSizes.cardRadiusSm,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: const TextField(
            style: TextStyle(color: AppColors.whiteColor),
            decoration: InputDecoration(
              hintText: 'Search for PRO traders',
              hintStyle: TextStyle(color: AppColors.greyColor),
              border: InputBorder.none,
              icon: Icon(Icons.search, color: AppColors.greyColor),
            ),
          ),
        ),
        const SizedBox(height: 16),
    
        // Copiers list
        ListView.separated(
          shrinkWrap: true,
          itemCount: copiers.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final copier = copiers[index];
            return  Column(
        
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
        
                      RCircularContainer(
                        width: 45,
                        height: 45,
                        backgroundColor: copier["borderColor"] as Color,
                        borderColor: copier["color"] as Color,
                        showBorder: true,
                        child: Center(
                          child: Text(
                            copier["initials"] as String,
                            style: RTextStyle.subtitle.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: RSizes.md),
        
                      Expanded(
                        child: Text(
                          copier["name"] as String,
                          style: RTextStyle.body.copyWith(
                          color: AppColors.greyColor
                          ),
                        ),
                      ),
                      Spacer(),
                      Image.asset(RImages.proTraderBadge),
        
                    ],
                  ),
        
                  const SizedBox(height: RSizes.md),
                  
                  Row(
                      
                      children: [
                        Column(
                          children: [
        
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Total volume",
                                style: RTextStyle.bodySmall.copyWith(
                                  color:  AppColors.greyColor,
                                ),
                              ),
                              Text(
                                "996.28 USDT",
                                style: RTextStyle.subtitle.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ]
                          )
        
                          ],
                        ),
        
                        Spacer(),
        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Total Profit",
                              style: RTextStyle.bodySmall.copyWith(
                                color: AppColors.greyColor,
                              ),
                            ),
                            Text(
                              "278.81 USDT",
                              style: RTextStyle.subtitle.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ]
                        ),
                      ],
        
                  ),
        
              SizedBox(height: RSizes.md),                    
              Divider(
                thickness: 2,
                color: Color(0xFF262932),
              ),
        
              ],
        
            );
          },
        ),
      ],
    ),
  );
}


  // --- Helper Sections ---
  Widget _buildTraderHeader() {
    return RRoundedContainer(
      padding: EdgeInsets.all(RSizes.gridViewSpacing),
      backgroundColor: AppColors.lightBackgroundColor,
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Copy trading assets", style: RTextStyle.bodySmall.copyWith(color: AppColors.greyColor)),
              const SizedBox(height: RSizes.sm),
              Text("\$5,564.96", style: RTextStyle.body.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.w700)),
            ],
          ),
    
              const SizedBox(height: RSizes.sm),
            Divider(
              thickness: 2,
              color: Color(0xFF262932),
            ),
    
              const SizedBox(height: RSizes.sm),
    
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Net Profit", style: RTextStyle.bodySmall.copyWith(color: AppColors.greyColor)),
                  const SizedBox(height: RSizes.sm),
                  Text("\$5,564.96", style: RTextStyle.body.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.w700)),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("Today's PNL", style: RTextStyle.bodySmall.copyWith(color: AppColors.greyColor)),
                  const SizedBox(height: RSizes.sm),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward_rounded, color: AppColors.greenColor, size: 20),
                      Text("207.25", style: RTextStyle.body.copyWith(color: AppColors.greenColor, fontWeight: FontWeight.w700)),
                    ],
                  ),
                ],
              ),              
            ],
          ),
        ],
      ),
    
    );
  }




  Widget _statItem(String label, String value, Color color) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(RImages.btcImgWithArrow),
            SizedBox(width: RSizes.md),
            Text(label,
                style: RTextStyle.bodySmall.copyWith(color: Colors.grey[300])),
            Spacer(),
            Text(value,
                style: RTextStyle.bodySmall
                    .copyWith(color: color)),
          ],
        ),
      );

    Widget _tradeDetail(String label, String value, {bool showImg = false}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment:
              showImg ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: RTextStyle.body.copyWith(color: AppColors.greyColor),
            ),
            if (showImg) ...[
              const Spacer(),
              Image.asset(RImages.avatarImg),
              const SizedBox(width: RSizes.xs),
            ],
            Text(
              value,
              style: RTextStyle.body.copyWith(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }


}


