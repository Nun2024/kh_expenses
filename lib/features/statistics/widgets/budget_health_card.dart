import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class BudgetHealthCard extends StatelessWidget {
  final String activePeriod;
  final bool isKhrFirst;
  const BudgetHealthCard({super.key, this.activePeriod = 'Month', this.isKhrFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: AppColors.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check_circle, color: AppColors.onSecondaryContainer, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)?.budgetHealth ?? 'Budget Health', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                  Text(AppLocalizations.of(context)?.budgetRemainingMock ?? '68% of monthly limit remaining', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              elevation: 1,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: Text(AppLocalizations.of(context)?.limitsBtn ?? 'Limits'),
          ),
        ],
      ),
    );
  }
}
