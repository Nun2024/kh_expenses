import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class StatisticsHeader extends StatelessWidget {
  final String activePeriod;
  final Function(String) onPeriodChanged;

  const StatisticsHeader({
    super.key,
    required this.activePeriod,
    required this.onPeriodChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.navAnalytics ?? 'Analytics',
                  style: AppTheme.headlineLg.copyWith(color: AppColors.onSurface, fontSize: 28),
                ),
                Text(
                  AppLocalizations.of(context)?.expenseOverview ?? 'Expense overview & insights',
                  style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 2),
                ],
              ),
              child: const Icon(Icons.calendar_month, color: AppColors.onSurface),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Segmented Period Pill Switcher
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerHigh.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
          ),
          child: Row(
            children: [
              Expanded(child: _buildSegmentButton(context, 'Week', AppLocalizations.of(context)?.periodWeek ?? 'Week', activePeriod == 'Week')),
              Expanded(child: _buildSegmentButton(context, 'Month', AppLocalizations.of(context)?.periodMonth ?? 'Month', activePeriod == 'Month')),
              Expanded(child: _buildSegmentButton(context, 'Year', AppLocalizations.of(context)?.periodYear ?? 'Year', activePeriod == 'Year')),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Current Active Scope Indicator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.event, size: 16, color: AppColors.primary),
                  const SizedBox(width: 6),
                  Text('September 2026', style: AppTheme.bodySm.copyWith(fontWeight: FontWeight.w600, color: AppColors.onSurface)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.primaryFixed.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  AppLocalizations.of(context)?.cycle30Days ?? '30 Days Cycle',
                  style: AppTheme.labelSm.copyWith(color: AppColors.onPrimaryFixedVariant, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSegmentButton(BuildContext context, String value, String label, bool isSelected) {
    return GestureDetector(
      onTap: () => onPeriodChanged(value),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2),
                ],
              )
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTheme.labelMd.copyWith(
                color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.w700 : null,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 4),
              Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
