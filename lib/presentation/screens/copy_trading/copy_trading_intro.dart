import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:roqqu_assessment/utils/constants/colors.dart';
import 'package:roqqu_assessment/routes/route_helper.dart';
import 'package:roqqu_assessment/utils/constants/image_strings.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/helpers/helper_functions.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';

class CopyTradingIntro extends StatefulWidget {
  const CopyTradingIntro({super.key});

  @override
  State<CopyTradingIntro> createState() => _CopyTradingIntroState();
}

class _CopyTradingIntroState extends State<CopyTradingIntro> {
  int _currentPage = 0;
  final PageController _controller = PageController();

  final List<Map<String, String>> _pages = [
    {
      'title': 'Copy PRO traders',
      'description':
          'Leverage expert strategies from professional traders to boost your trading results.',
      'image': RImages.copyProTrader,
    },
    {
      'title': 'Do less, Win more',
      'description':
          'Streamline your approach to trading and increase your winning potential effortlessly.',
      'image': RImages.copyProTrader,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Copy trading', style: TextStyle(color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w400)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildIndicator(),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return _buildIntroContent(
                    image: page['image']!,
                    title: page['title']!,
                    description: page['description']!,
                  );
                },
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            RElevatedButtonTheme.gradientButton(
              onPressed: () {
                if (_currentPage == _pages.length - 1) {
                  Get.toNamed(RRouteHelper.copyTradingRisk);
                } else {
                  _controller.nextPage(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  );
                }
              },
              text: _currentPage == _pages.length - 1
                  ? 'Get started'
                  : 'Next',
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_pages.length, (index) {
        bool active = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          height: 4,
          // width: 162,
          width: RHelperFunctions.screenWidth() * 0.4,
          decoration: BoxDecoration(
            color: (active) ? Colors.blueAccent : (index == 0) ?  Colors.blueAccent : Colors.grey.shade700,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }

  Widget _buildIntroContent({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.whiteColor,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: RSizes.sm),
        Text(
          description,
          style: const TextStyle(
              color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: RSizes.spaceBtwSections * 2),
        Center(child: Image.asset(image)),
        const SizedBox(height: 24),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Watch a how to video',
              style: TextStyle(
            
                  color: Colors.lightBlueAccent,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
