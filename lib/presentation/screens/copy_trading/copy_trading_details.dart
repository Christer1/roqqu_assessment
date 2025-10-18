import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/common/functions/bottom_sheet.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_risks_modal.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/widgets/profile_badge.dart';
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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          leading: const BackButton(color: Colors.white),
          title: Text(
            'Trading Details',
            style: TextStyles.subtitle.copyWith(
              color: Colors.white,
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
                    _buildTraderStats(),
                    const SizedBox(height: RSizes.spaceBtwItems),
                    _buildCertifiedSection(),
                    const SizedBox(height: RSizes.xs),

                    // Tab bar view
                    RRoundedContainer(
                      radius: RSizes.cardRadiusXs,
                      backgroundColor: Color.fromARGB(255, 24, 29, 35),
                      padding: EdgeInsets.all(0),
                      child: const TabBar(
                        labelPadding: EdgeInsets.all(0),
                        dividerColor: Colors.transparent,
                        indicatorWeight: 0.5,
                        indicatorColor: Color(0xFF85D1F0),
                        labelColor: Colors.white,
                        unselectedLabelColor: Color(0xFFA7B1BC),
                        tabs: [
                          Tab(text: 'Chart'),
                          Tab(text: 'Stats'),
                          Tab(text: 'All Trades'),
                          Tab(text: 'Copiers'),
                        ],
                      ),
                    ),
                  //tab view
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SingleChildScrollView(child: _buildChartTab(context)),
                        SingleChildScrollView(child: _buildStatsTab(context)),
                        SingleChildScrollView(child: _buildAllTradesTab(context)),
                        SingleChildScrollView(child: _buildCopiersTab(context)),
                      ],
                    ),
                  ),

                  ],
                ),
              ),
            ),

            // Fixed Copy Trade Button
            Container(
              color: AppColors.backgroundColor,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: RSizes.spaceBtwItems),
              child: RElevatedButtonTheme.gradientButton(
                onPressed: () => _showRiskSheet(context),
                text: 'Copy Trade',
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- Chart Tab ---
  Widget _buildChartTab(BuildContext context) {
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
                        (i) => FlSpot(i.toDouble(), dataPoints[i])),
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
                    style: TextStyles.bodySmall.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700)),
                SizedBox(height: RSizes.sm),                    
                const SizedBox(height: RSizes.sm),
                _statItem('Average ROI', '+33.73%', Color(0xFF00FF85)),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                 _statItem('Win rate', '100%', Colors.white),
                Divider(
                  thickness: 2,
                  color: Color(0xFF262932),
                ),
                SizedBox(height: RSizes.sm),                    
                _statItem('Total profit', '61850.63 USDT', Colors.white),
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
                _statItem('Total trades', '72', Colors.white),
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
                    style: TextStyles.bodySmall.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w700)),

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
                                  style: TextStyles.body
                                      .copyWith(color: AppColors.textGreyColor)),
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
  Widget _buildAllTradesTab(BuildContext context) {
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
                      style: TextStyles.subtitle
                          .copyWith(color: AppColors.textGreyColor)),
              
                              Text(' - 10X',
                      style: TextStyles.subtitle
                          .copyWith(color: Color(0xFF85D1F0), fontSize: 16)),
              Spacer(),
              Text('+3.28% ROI',
                  style: TextStyles.body
                      .copyWith(color: const Color(0xFF17B26A), fontWeight: FontWeight.w500)),
              ],
              ),
            ),



            const SizedBox(height: RSizes.sm),
            _tradeDetail('Entry price', '1.9661 USDT'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Market price', '1.9728 USDT'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Copiers', '20'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Copiers amount', '1009.772 USDT'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Entry time', '01:22 PM'),
            SizedBox(height: RSizes.md),
            _tradeDetail('Exit time', '01:22 PM'),
            SizedBox(height: RSizes.md),          ],
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
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search for PRO traders',
              hintStyle: TextStyle(color: Color(0xFFA7B1BC)),
              border: InputBorder.none,
              icon: Icon(Icons.search, color: Color(0xFFA7B1BC)),
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
                            style: TextStyles.subtitle.copyWith(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: RSizes.md),
        
                      Expanded(
                        child: Text(
                          copier["name"] as String,
                          style: TextStyles.body.copyWith(
                          color: AppColors.textGreyColor
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
                                style: TextStyles.bodySmall.copyWith(
                                  color: const Color(0xFFA7B1BC),
                                ),
                              ),
                              Text(
                                "996.28 USDT",
                                style: TextStyles.subtitle.copyWith(
                                  color: Colors.white,
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
                              style: TextStyles.bodySmall.copyWith(
                                color: const Color(0xFFA7B1BC),
                              ),
                            ),
                            Text(
                              "278.81 USDT",
                              style: TextStyles.subtitle.copyWith(
                                color: Colors.white,
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
    return Row(
      children: [

        RProfileBadge(
          width: 50,
          height: 50,
          backgroundColor: const Color.fromRGBO(71, 205, 137, 0.14),
          borderColor: const Color(0xFF47CD89),
          text: "JI",
          textFontSize: 18,
        ),

        const SizedBox(width: RSizes.sm2),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: TextStyles.subtitle
                    .copyWith(color: Colors.white, fontSize: 18)),
            Row(
              children: [
                const Icon(Icons.people_alt_outlined,
                    color: Color(0xFF85D1F0), size: 16),
                const SizedBox(width: RSizes.xs),
                Text('500 Copiers',
                    style: TextStyles.body
                        .copyWith(color: const Color(0xFF85D1F0), fontSize: 12)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTraderStats() {
    return Row(
      children: [
        _infoChip('43 trading days'),
        const SizedBox(width: RSizes.sm),
        _infoChip('15% profit-share'),
        const SizedBox(width: RSizes.sm),
        _infoChip('56 total orders'),
      ],
    );
  }

  Widget _buildCertifiedSection() {
    return RRoundedContainer(
      radius: RSizes.cardRadiusXs,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      backgroundColor: AppColors.lightBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Certified PROtrader",
              style: TextStyles.body.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w700)),
          const SizedBox(height: RSizes.sm),
          Row(
            children: [
              _badge(Icons.insert_chart, "High win rate", const Color(0xFF17B26A),
                  const Color.fromRGBO(23, 178, 106, 0.08)),
              const SizedBox(width: RSizes.sm),
              _badge(Icons.show_chart, "Great risk control", const Color(0xFFF79009),
                  const Color.fromRGBO(247, 144, 9, 0.08)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip(String text) => RRoundedContainer(
        backgroundColor: AppColors.lightBackgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        radius: RSizes.cardRadiusXs,
        child: Text(text,
            style: TextStyles.bodySmall.copyWith(color: const Color(0xFFA7B1BC))),
      );

  Widget _badge(IconData icon, String label, Color color, Color bg) =>
      RRoundedContainer(
        radius: RSizes.cardRadiusXs,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        backgroundColor: bg,
        child: Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: RSizes.sm),
            Text(label, style: TextStyles.bodySmall.copyWith(color: color)),
          ],
        ),
      );

  Widget _statItem(String label, String value, Color color) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(RImages.btcImgWithArrow),
            SizedBox(width: RSizes.md),
            Text(label,
                style: TextStyles.bodySmall.copyWith(color: Colors.grey[300])),
            Spacer(),
            Text(value,
                style: TextStyles.bodySmall
                    .copyWith(color: color)),
          ],
        ),
      );

  Widget _tradeDetail(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style:
                    TextStyles.body.copyWith(color: AppColors.textGreyColor)),
            Text(value,
                style: TextStyles.body.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
          ],
        ),
  );

  void _showRiskSheet(BuildContext context) {
    bool isChecked = false;
    rShowSelectionSheet(
      context,
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Image.asset(RImages.importantMessage,
                  height: 140, fit: BoxFit.contain),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text('Important message!',
                  style: TextStyles.headline
                      .copyWith(color: Colors.white, fontSize: 20)),
              const SizedBox(height: RSizes.sm),
              Text(
                "Don't invest unless you're prepared and understand the risks involved in copy trading.",
                style: TextStyles.body.copyWith(color: Colors.grey[300]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: RSizes.sm),
              RichText(
                text: TextSpan(
                  text: 'Learn more',
                  style:
                      TextStyles.body.copyWith(color: Colors.lightBlueAccent),
                  children: [
                    TextSpan(
                      text: ' about the risks.',
                      style: TextStyles.body
                          .copyWith(color: Colors.grey[300]),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
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
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: "Check this box to agree to Roqqu's copy trading ",
                        style: TextStyles.bodySmall.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        children: [
                          TextSpan(
                            text: 'policy',
                            style: TextStyles.body.copyWith(
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: AbsorbPointer(
                  absorbing: !isChecked,
                  child: Opacity(
                    opacity: isChecked ? 1.0 : 0.5,
                    child: RElevatedButtonTheme.gradientButton(
                      onPressed: () => CopyTradingRisksModal.show(context),
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
  }
}


