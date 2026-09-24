import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class QuickStatsGrid extends StatelessWidget {
  final bool isKhrFirst;
  const QuickStatsGrid({super.key, this.isKhrFirst = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            context,
            title: AppLocalizations.of(context)?.todaysSpend ?? "Today's Spend",
            icon: Icons.receipt_long,
            iconBgColor: AppColors.surfaceContainer,
            iconColor: AppColors.primary,
            mainValue: isKhrFirst ? '៛51,000' : '\$12.50',
            subValue: isKhrFirst ? '\$12.50 USD' : '៛51,000 KHR',
            footerText: AppLocalizations.of(context)?.transactionsTodayMock ?? '3 transactions today',
            footerIcon: Icons.schedule,
            footerBgColor: AppColors.secondaryFixed.withOpacity(0.3),
            footerColor: AppColors.secondary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildBudgetCard(context, isKhrFirst: isKhrFirst),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String mainValue,
    required String subValue,
    required String footerText,
    required IconData footerIcon,
    required Color footerBgColor,
    required Color footerColor,
  }) {
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
              Text(title, style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(mainValue, style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface)),
          Text(subValue, style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: footerBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(footerIcon, size: 12, color: footerColor),
                const SizedBox(width: 4),
                Text(footerText, style: AppTheme.labelSm.copyWith(color: footerColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetCard(BuildContext context, {required bool isKhrFirst}) {
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
              Text(AppLocalizations.of(context)?.monthlyBudget ?? 'Monthly Budget', style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.donut_large, size: 16, color: AppColors.secondary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(isKhrFirst ? '៛1.33M' : '\$327.50', style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface)),
              const SizedBox(width: 4),
              Text(isKhrFirst ? '/ ៛2M' : '/ \$500', style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.655,
              backgroundColor: AppColors.surfaceContainer,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)?.budgetUsedPercentMock ?? '65% used', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
              Text(isKhrFirst ? 'Left: ៛704K' : (AppLocalizations.of(context)?.budgetLeftAmountMock ?? 'Left: \$172.50'), style: AppTheme.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w700)),
            ],
          ),
        ],
      ),
    );
  }
}
