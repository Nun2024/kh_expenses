import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class SpendingCard extends StatelessWidget {
  const SpendingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary,
            AppColors.primaryContainer,
            AppColors.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background icon
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Icons.account_balance_wallet,
              size: 140,
              color: Colors.white.withOpacity(0.15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month, color: AppColors.onPrimary.withOpacity(0.9), size: 16),
                        const SizedBox(width: 6),
                        Text(
                          AppLocalizations.of(context)?.totalSpendingMonth ?? 'TOTAL SPENDING (SEPTEMBER 2026)',
                          style: AppTheme.labelMd.copyWith(
                            color: AppColors.onPrimary.withOpacity(0.9),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLowest.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        AppLocalizations.of(context)?.usdAndKhr ?? 'USD & KHR',
                        style: AppTheme.labelSm.copyWith(color: AppColors.onPrimary),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '\$327.50',
                      style: AppTheme.displayHeroMobile.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'USD',
                      style: AppTheme.headlineSm.copyWith(
                        color: AppColors.secondaryFixed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.currency_exchange, color: AppColors.tertiaryFixedDim, size: 16),
                    const SizedBox(width: 6),
                    Text(
                      '≈ ៛1,338,000 KHR',
                      style: AppTheme.currencySecondary.copyWith(
                        color: AppColors.onPrimary.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: AppColors.onPrimary.withOpacity(0.15))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.swap_horiz, color: AppColors.onPrimary.withOpacity(0.8), size: 14),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)?.exchangeRateMock ?? 'Rate: \$1 = ៛4,085',
                            style: AppTheme.bodySm.copyWith(
                              color: AppColors.onPrimary.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.trending_down, color: AppColors.secondaryFixed, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)?.vsLastMonthMock ?? '-12% vs last mo',
                            style: AppTheme.labelMd.copyWith(
                              color: AppColors.secondaryFixed,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
