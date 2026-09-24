import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

import 'package:provider/provider.dart';
import '../../expenses/providers/expense_provider.dart';
import 'package:intl/intl.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class TotalSpendingSummary extends StatelessWidget {
  final String activePeriod;
  final bool isKhrFirst;
  const TotalSpendingSummary({super.key, this.activePeriod = 'Month', this.isKhrFirst = false});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();
    final totalUSD = provider.totalUSDSpendingForPeriod(activePeriod);
    final totalKHR = (totalUSD * 4085).round();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryContainer,
            AppColors.primary,
            AppColors.secondary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.22),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 16,
            top: 12,
            child: Opacity(
              opacity: 0.15,
              child: const Icon(Icons.trending_down, size: 80, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)?.totalOutflow ?? 'TOTAL OUTFLOW',
                      style: AppTheme.labelMd.copyWith(
                        color: AppColors.onPrimaryContainer.withOpacity(0.8),
                        letterSpacing: 1.2,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.trending_down, size: 14, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            '-12% vs Aug',
                            style: AppTheme.labelSm.copyWith(color: Colors.white),
                          ),
                        ],
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
                      isKhrFirst ? '៛${NumberFormat('#,###').format(totalKHR)}' : '\$${totalUSD.toStringAsFixed(2)}',
                      style: AppTheme.displayHeroMobile.copyWith(color: Colors.white),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      isKhrFirst ? 'KHR' : 'USD',
                      style: AppTheme.bodySm.copyWith(color: AppColors.primaryFixed),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      isKhrFirst ? '≈ \$${totalUSD.toStringAsFixed(2)}' : '≈ ៛${NumberFormat('#,###').format(totalKHR)}',
                      style: AppTheme.headlineSm.copyWith(color: AppColors.tertiaryFixed),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isKhrFirst ? 'USD' : 'KHR',
                      style: AppTheme.bodySm.copyWith(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white.withOpacity(0.15))),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.speed, size: 16, color: AppColors.primaryFixed),
                          const SizedBox(width: 4),
                          Text(AppLocalizations.of(context)?.dailyPace ?? 'Daily Pace', style: AppTheme.bodySm.copyWith(color: Colors.white.withOpacity(0.9))),
                        ],
                      ),
                      Text(
                        isKhrFirst ? (AppLocalizations.of(context)?.avgDailyPaceMockKhr ?? 'Avg ៛44.5K / day') : (AppLocalizations.of(context)?.avgDailyPaceMockUsd ?? 'Avg \$10.90 / day'),
                        style: AppTheme.currencySecondary.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
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
