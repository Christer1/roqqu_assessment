import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/copy_trading_intro.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/action_buttons.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/balance_section_widget.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/carousel_cards.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/copy_trading_card.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/list_coin_section.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/place_holder_page.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/stay_updated.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';

class CryptoDashboardScreen extends StatefulWidget {
  const CryptoDashboardScreen({super.key});

  @override
  State<CryptoDashboardScreen> createState() => _CryptoDashboardScreenState();
}

class _CryptoDashboardScreenState extends State<CryptoDashboardScreen> {
  int _currentIndex = 0;
  bool _isModalOpen = false;

  final List<Widget> _pages = [
    const HomePage(), // current dashboard content
    const PlaceholderPage(title: 'Wallet'),
    const PlaceholderPage(title: 'History'),
    const PlaceholderPage(title: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

void _openModal() {
  setState(() {
    _isModalOpen = true;
  });
}

void _closeModal() {
  setState(() {
    _isModalOpen = false;
  });
}


Widget _buildModalSheet() {
  final screenHeight = MediaQuery.of(context).size.height;

  final tradeItems = [
    {'title': 'Buy', 'icon': Icons.shopping_bag_outlined},
    {'title': 'Sell', 'icon': Icons.attach_money},
    {'title': 'Swap', 'icon': Icons.swap_horiz},
    {'title': 'Send', 'icon': Icons.send_outlined},
    {'title': 'Receive', 'icon': Icons.qr_code_outlined},
    {'title': 'Invest', 'icon': Icons.trending_up, 'isNew': true},
  ];

  final earnItems = [
    {'title': "Roqqu'n'roll", 'icon': Icons.sports_motorsports_outlined, 'isNew': true},
    {'title': 'Savings', 'icon': Icons.savings_outlined},
    {'title': 'Missions', 'icon': Icons.flag_outlined, 'isNew': true},
    {'title': 'Copy trading', 'icon': Icons.copy_outlined, 'isNew': true, 'page': CopyTradingIntro()},
    {'title': 'Staking', 'icon': Icons.lock_outline},
    {'title': 'Earn', 'icon': Icons.account_balance_wallet_outlined},
  ];

  return Positioned(
    top: screenHeight * 0.15,
    left: 0,
    right: 0,
    bottom: 0,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      height: screenHeight * 0.85,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  _buildModalSection('Trade', tradeItems),
                  const SizedBox(height: 20),
                  _buildModalSection('Earn', earnItems),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


Widget _buildModalSection(String title, List<Map<String, dynamic>> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
        Text(
          title,
          style: TextStyles.body.copyWith(
            color: Color(0xFFA7B1BC),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: RSizes.md),
      RRoundedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        backgroundColor: AppColors.lightBackgroundColor,
        radius: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Column(
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isNew = item['isNew'] == true;
      
                return GestureDetector(

                    onTap: () {

                      if (item.containsKey('page')) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => item['page'] as Widget),
                        );
                      } else {
                        log('Tapped on ${item['title']}');
                      }
                    },
                  child: Container(
                    margin: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundColor: AppColors.lightBackgroundColor,
                              child: RCircularContainer(
                                backgroundColor: AppColors.backgroundColor,
                                child: Icon(
                                  item['icon'] as IconData,
                                  size: 18,
                                  color: Color(0xFF68CFEE),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              item['title'] as String,
                              style: TextStyles.body.copyWith(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            if (isNew)
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(222, 155, 9, 0.08),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'New',
                                  style: TextStyles.body.copyWith(
                                    color: Color(0xFFF79009),
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.chevron_right,
                              color: Colors.white38,
                              size: 22,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    ],
  );
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Stack(
      children: [
        _pages[_currentIndex],

        // Overlay the modal when open
        if (_isModalOpen) _buildModalSheet(),
      ],
    ),
    bottomNavigationBar: _buildBottomNavigationBar(),
  );
}

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade800,
            width: 0.5,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Home
              _buildNavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                index: 0,
              ),
              
              // Wallet
              _buildNavItem(
                icon: Icons.account_balance_wallet_outlined,
                label: 'Wallet',
                index: 1,
              ),
              
              // Center Button (Special) - Changes to cancel when modal is open
              _buildCenterButton(),
              
              // History
              _buildNavItem(
                icon: Icons.history_outlined,
                label: 'History',
                index: 2,
              ),
              
              // Profile
              _buildNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isActive = _currentIndex == index;
    
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color:  Colors.white70,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyles.body.copyWith(
              color:  Colors.white70,
              fontSize: 10,
              fontWeight: isActive ? FontWeight.w700 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }


Widget _buildCenterButton() {
  return GestureDetector(
    onTap: _isModalOpen ? _closeModal : _openModal,
    child: Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: _isModalOpen ? Color(0xFF2764FF) : null,
        gradient: _isModalOpen ?  null : LinearGradient(
          colors: [
            Color(0xFF483BEB),
            Color(0xFF7847E1),
            Color(0xFFDD568D),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary,
            blurRadius: 10,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Icon(
        _isModalOpen ? Icons.close : Icons.dashboard,
        color: Colors.white,
        size: 28,
      ),
    ),
  );
}


}

// Your existing HomePage content wrapped in a separate widget
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        /// Full gradient background with curved bottom
        RRoundedContainer(
          width: double.infinity,
          height: screenHeight,
          gradient: const LinearGradient(
            colors: [
              Color(0xFFECE9FF),
              Color(0xFFD7D1FF),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Top row (Dropdown + icons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Dropdown (Crypto)
                    RRoundedContainer(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      backgroundColor: Colors.white,
                      radius: RSizes.cardRadiusLg,
                      child: Row(
                        children:  [
                          Text(
                            'Crypto',
                            style: TextStyles.body.copyWith(color: Colors.black),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                        ],
                      ),
                    ),

                    /// Icons Row (headphone, notification, flag)
                     Row(
                      children: [
                        Icon(Icons.headphones_outlined, color: Colors.black),
                        SizedBox(width: 16),
                        Icon(Icons.notifications_none, color: Colors.black),
                        SizedBox(width: 16),
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(
                             RImages.usFlag),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        /// Overlapping container (main content)
        Positioned(
          top: screenHeight * 0.15,
          left: 0,
          right: 0,
          child: Container(
            height: screenHeight * 0.85,
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  BalanceSectionWidget(),
                  const SizedBox(height: RSizes.spaceBtwItems / 3),
                  ActionButtons(),

                  // Copy Trading Card
                  CopyTradingCard(),

                  // Stay Updated Section
                  StayUpdated(),

                  // Carousel Cards
                  CarouselCards(),

                  const SizedBox(height: RSizes.xl),

                  // Listed Coins Section
                  ListCoinSection(),

                  const SizedBox(height: 20), // Extra bottom padding
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}