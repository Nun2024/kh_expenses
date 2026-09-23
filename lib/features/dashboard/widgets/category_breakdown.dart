import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class CategoryBreakdown extends StatelessWidget {
  const CategoryBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 16,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(AppLocalizations.of(context)?.spendingByCategory ?? 'Spending by Category', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(AppLocalizations.of(context)?.seeBreakdown ?? 'See Breakdown', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
                    const Icon(Icons.chevron_right, size: 16, color: AppColors.primary),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildCategoryItem(
            emoji: '🍜',
            bgColor: AppColors.tertiaryFixed.withOpacity(0.6),
            title: AppLocalizations.of(context)?.categoryFoodDining ?? 'Food & Dining',
            amount: '\$120.00',
            percentage: '37%',
            progressValue: 0.37,
            progressColor: AppColors.tertiary,
          ),
          const SizedBox(height: 14),
          _buildCategoryItem(
            emoji: '🛍',
            bgColor: AppColors.secondaryFixed.withOpacity(0.6),
            title: AppLocalizations.of(context)?.categoryShopping ?? 'Shopping',
            amount: '\$82.00',
            percentage: '25%',
            progressValue: 0.25,
            progressColor: AppColors.secondary,
          ),
          const SizedBox(height: 14),
          _buildCategoryItem(
            emoji: '🚕',
            bgColor: AppColors.primaryFixed.withOpacity(0.5),
            title: AppLocalizations.of(context)?.categoryTransport ?? 'Transport (PassApp/Grab)',
            amount: '\$65.00',
            percentage: '20%',
            progressValue: 0.20,
            progressColor: AppColors.primary,
          ),
          const SizedBox(height: 14),
          _buildCategoryItem(
            emoji: '💡',
            bgColor: AppColors.surfaceContainerHighest,
            title: AppLocalizations.of(context)?.categoryUtilities ?? 'Utilities (EDC/Water)',
            amount: '\$60.00',
            percentage: '18%',
            progressValue: 0.18,
            progressColor: AppColors.outline,
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem({
    required String emoji,
    required Color bgColor,
    required String title,
    required String amount,
    required String percentage,
    required double progressValue,
    required Color progressColor,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: Text(emoji, style: const TextStyle(fontSize: 14)),
                ),
                const SizedBox(width: 8),
                Text(title, style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500)),
              ],
            ),
            Row(
              children: [
                Text(amount, style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w700)),
                const SizedBox(width: 4),
                Text('($percentage)', style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progressValue,
            backgroundColor: AppColors.surfaceContainer,
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            minHeight: 8,
          ),
        ),
      ],
    );
  }
}
