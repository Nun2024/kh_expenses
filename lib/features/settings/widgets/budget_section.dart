import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class BudgetSection extends StatelessWidget {
  const BudgetSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)?.settingsMonthlyBudget ?? 'MONTHLY BUDGET', style: AppTheme.labelMd.copyWith(color: AppColors.outline, fontWeight: FontWeight.bold)),
              Text(AppLocalizations.of(context)?.settingsActiveCycle ?? 'Active Cycle', style: AppTheme.labelSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 3,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Positioned(
              //   right: -24,
              //   top: -24,
              //   child: Container(
              //     width: 96,
              //     height: 96,
              //     decoration: BoxDecoration(
              //       color: AppColors.primaryContainer.withOpacity(0.1),
              //       shape: BoxShape.circle,
              //     ),
              //   ),
              // ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.track_changes, color: AppColors.primary, size: 22),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)?.settingsMonthlyBudgetLimit ?? 'Monthly Budget Limit', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                              Text(AppLocalizations.of(context)?.settingsSmartAlerts ?? 'Smart alerts at 80% threshold', style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Text(AppLocalizations.of(context)?.settingsEdit ?? 'Edit', style: AppTheme.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              const Icon(Icons.edit, size: 14, color: AppColors.primary),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2))),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text('\$500.00', style: AppTheme.currencyPrimary.copyWith(color: AppColors.primary)),
                                const SizedBox(width: 8),
                                Text('≈ ៛2,042,500', style: AppTheme.currencySecondary.copyWith(color: AppColors.tertiary)),
                              ],
                            ),
                            const SizedBox(height: 2),
                            Text(AppLocalizations.of(context)?.settingsBudgetRenews ?? 'Renews automatically on 1st of month', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            AppLocalizations.of(context)?.settingsSafeMargin ?? 'Safe Margin',
                            style: AppTheme.labelSm.copyWith(color: AppColors.onSecondaryContainer, fontWeight: FontWeight.bold, fontSize: 11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
