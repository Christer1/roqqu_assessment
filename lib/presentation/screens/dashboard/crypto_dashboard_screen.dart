import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/common/custom_shapes/circular_container.dart';
import 'package:roqqu_assessment/common/custom_shapes/rounded_container.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/utils/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/controllers/dashboard_controller.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/action_buttons.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/balance_section_widget.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/carousel_cards.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/copy_trading_card.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/list_coin_section.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/place_holder_page.dart';
import 'package:roqqu_assessment/presentation/screens/dashboard/widgets/stay_updated.dart';
import 'package:roqqu_assessment/routes/route_helper.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/helpers/helper_functions.dart';

class CryptoDashboardScreen extends StatelessWidget {
  const CryptoDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find<DashboardController>();
    
    // pages
    final List<Widget> pages = [
      const HomePage(),
      const PlaceholderPage(title: 'Wallet'),
      const PlaceholderPage(title: 'History'),
      const PlaceholderPage(title: 'Profile'),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Current page
          Obx(() => pages[dashboardController.currentIndex.value]),
          
          // Modal overlay
          Obx(() => dashboardController.isModalOpen.value 
              ? _buildModalSheet(context, dashboardController) 
              : const SizedBox.shrink()
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(dashboardController),
    );
  }

  Widget _buildModalSheet(BuildContext context, DashboardController controller) {
    final screenHeight = RHelperFunctions.screenHeight();

    final tradeItems = [
      {'title': 'Buy'},
      {'title': 'Sell'},
      {'title': 'Swap'},
      {'title': 'Send'},
      {'title': 'Receive'},
      {'title': 'Invest', 'isNew': true},
    ];

    final earnItems = [
      {'title': "Roqqu'n'roll", 'isNew': true},
      {'title': 'Savings'},
      {'title': 'Missions', 'isNew': true},
      {'title': 'Copy trading', 'isNew': true, 'page': RRouteHelper.copyTradingIntro},
      {'title': 'Staking'},
      {'title': 'Earn'},
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
            topLeft: Radius.circular(RSizes.cardRadiusMd * 4),
            topRight: Radius.circular(RSizes.cardRadiusMd * 4),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.backgroundColor,
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(-2, -3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: RSizes.defaultSpace),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: RSizes.spaceBtwItems, vertical: RSizes.spaceBtwItems),
                child: Column(
                  children: [
                    _buildModalSection(context, 'Trade', tradeItems, controller),
                    const SizedBox(height: 20),
                    _buildModalSection(context, 'Earn', earnItems, controller),
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

Widget _buildModalSection(BuildContext context, String title, List<Map<String, dynamic>> items, DashboardController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: RTextStyle.body.copyWith(
          color: AppColors.greyColor,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(height: RSizes.md),
      RRoundedContainer(
        padding: const EdgeInsets.symmetric(horizontal: RSizes.spaceBtwItems, vertical: RSizes.spaceBtwItems),
        backgroundColor: AppColors.lightBackgroundColor,
        radius: RSizes.cardRadiusSm * 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: RSizes.spaceBtwItems),
            Column(
              children: List.generate(items.length, (index) {
                final item = items[index];
                final isNew = item['isNew'] == true;

                void handleItemTap() {
                  if (item.containsKey('page')) {
                    controller.closeModal();
                    Future.delayed(Duration.zero, () {
                      Get.toNamed(item['page']!);
                    });
                  }
                }

                return GestureDetector(
                  onTap: handleItemTap,
                  child: Container(
                    margin: EdgeInsets.only(bottom: index == items.length - 1 ? 0 : 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: RSizes.spaceBtwItems,
                              backgroundColor: AppColors.lightBackgroundColor,
                              child: RCircularContainer(
                                backgroundColor: AppColors.backgroundColor,
                                child: Icon(
                                  Icons.account_balance_wallet_outlined,
                                  size: RSizes.cardRadiusLg,
                                  color: Color(0xFF68CFEE),
                                ),
                              ),
                            ),
                            const SizedBox(width: RSizes.defaultSpace * 0.5),
                            Text(
                              item['title'] as String,
                              style: RTextStyle.body.copyWith(
                                color: Colors.white,
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
                                  style: RTextStyle.body.copyWith(
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
                              size: RSizes.iconMd,
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

  Widget _buildBottomNavigationBar(DashboardController controller) {
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
          padding: const EdgeInsets.symmetric(horizontal: RSizes.spaceBtwItems, vertical: RSizes.spaceBtwItems/2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                controller: controller,
                icon: Icons.home_outlined,
                label: 'Home',
                index: 0,
              ),
              _buildNavItem(
                controller: controller,
                icon: Icons.account_balance_wallet_outlined,
                label: 'Wallet',
                index: 1,
              ),
              _buildCenterButton(controller),
              _buildNavItem(
                controller: controller,
                icon: Icons.history_outlined,
                label: 'History',
                index: 2,
              ),
              _buildNavItem(
                controller: controller,
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
    required DashboardController controller,
    required IconData icon,
    required String label,
    required int index,
  }) {
    return Obx(() {
      final isActive = controller.currentIndex.value == index;
      
      return GestureDetector(
        onTap: () {
          // Close modal if open when switching tabs
          if (controller.isModalOpen.value) {
            controller.closeModal();
          }
          controller.onItemTapped(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white70,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: RTextStyle.body.copyWith(
                color: Colors.white70,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildCenterButton(DashboardController controller) {
    return Obx(() {
      final isModalOpen = controller.isModalOpen.value;
      
      return GestureDetector(
        onTap: isModalOpen ? controller.closeModal : controller.openModal,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isModalOpen ? Color(0xFF2764FF) : null,
            gradient: isModalOpen ? null : LinearGradient(
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
            isModalOpen ? Icons.close : Icons.dashboard,
            color: Colors.white,
            size: 28,
          ),
        ),
      );
    });
  }
}

// HomePage remains the same
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = RHelperFunctions.screenHeight();

    return Stack(
      children: [
        RRoundedContainer(
          width: double.infinity,
          height: screenHeight,
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(192, 207, 254, 1),
              Color.fromRGBO(243, 223, 244, 1),
              Color.fromRGBO(249, 216, 229, 1)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RRoundedContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      backgroundColor: Colors.white,
                      radius: RSizes.cardRadiusLg,
                      child: Row(
                        children: [
                          Text(
                            'Crypto',
                            style: RTextStyle.body.copyWith(color: Colors.black),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down, color: Colors.black),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.black, size: RSizes.iconMd),
                        SizedBox(width: 16),
                        Icon(Icons.headphones_outlined, color: Colors.black, size: RSizes.iconMd),
                        SizedBox(width: 16),
                        Icon(Icons.notifications_none, color: Colors.black, size: RSizes.iconMd),
                        SizedBox(width: 12),
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(RImages.usFlag),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
                  CopyTradingCard(),
                  StayUpdated(),
                  CarouselCards(),
                  const SizedBox(height: RSizes.xl),
                  ListCoinSection(),
                  const SizedBox(height: RSizes.defaultSpace * 4),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}