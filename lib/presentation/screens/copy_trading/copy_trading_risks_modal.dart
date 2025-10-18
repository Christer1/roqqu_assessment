import 'package:flutter/material.dart';
import 'package:roqqu_assessment/common/functions/bottom_sheet.dart';
import 'package:roqqu_assessment/core/constants/colors.dart';
import 'package:roqqu_assessment/core/constants/text_styles.dart';
import 'package:roqqu_assessment/presentation/screens/copy_trading/amount_screen.dart';
import 'package:roqqu_assessment/utils/constants/sizes.dart';
import 'package:roqqu_assessment/utils/theme/custom_themes/elevated_button_theme.dart';

class CopyTradingRisksModal extends StatelessWidget {
  const CopyTradingRisksModal({super.key});

  static void show(BuildContext context) {
    rShowSelectionSheet(
      heightFactor: 0.95,
      context,
      child: const CopyTradingRisksModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> risks = [
      {
        'title': 'Market risks',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Dependency on others',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Mismatched risk profiles',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Control and understanding',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Emotional decisions',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Costs involved',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Diversify',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
      {
        'title': 'Execution risks',
        'content':
            'All investments carry risks, including potential loss of capital.'
      },
    ];

    return _RisksContent(risks: risks);
  }
}

class _RisksContent extends StatefulWidget {
  final List<Map<String, String>> risks;

  const _RisksContent({required this.risks});

  @override
  State<_RisksContent> createState() => _RisksContentState();
}

class _RisksContentState extends State<_RisksContent> {
  int? expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Close button
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ),

        const SizedBox(height: RSizes.sm),

        Text(
          'Risks involved in copy trading',
          style: TextStyles.headline.copyWith(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: RSizes.sm),

        Text(
          'Please make sure you read the following risks involved in copy trading before making a decision.',
          style: TextStyles.body.copyWith(
            color: Colors.grey[400],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: RSizes.lg),

        // Risk list
        ...List.generate(widget.risks.length, (index) {
          final item = widget.risks[index];
          final isExpanded = expandedIndex == index;

          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.lightBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    item['title']!,
                    style: TextStyles.body.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  trailing: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      expandedIndex = isExpanded ? null : index;
                    });
                  },
                ),
                if (isExpanded)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Text(
                      item['content']!,
                      style: TextStyles.bodySmall.copyWith(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),

        const SizedBox(height: RSizes.lg),

        SizedBox(
          width: double.infinity,
          child: RElevatedButtonTheme.gradientButton(

            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AmountScreen()),
              );
            },

            text: 'I have read the risks',
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections),
      ],
    );
  }
}
