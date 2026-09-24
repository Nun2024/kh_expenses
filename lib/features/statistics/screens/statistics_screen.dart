import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../expenses/screens/add_expense_screen.dart';
import '../widgets/statistics_header.dart';
import '../widgets/total_spending_summary.dart';
import '../widgets/category_breakdown_chart.dart';
import '../widgets/spending_trend_chart.dart';
import '../widgets/top_category_spotlight.dart';
import '../widgets/budget_health_card.dart';
import '../../settings/screens/settings_screen.dart';
import '../../wallets/screens/wallets_screen.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String _activePeriod = 'Month';
  bool _isKhrFirst = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.surface.withOpacity(0.95),
        elevation: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/profiles/profiles.webp',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)?.appTitle ?? 'KH Expense',
                  style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface),
                ),
                Text(
                  AppLocalizations.of(context)?.smartLedger ?? 'Smart Ledger',
                  style: AppTheme.labelSm.copyWith(color: AppColors.outline),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isKhrFirst = !_isKhrFirst;
                });
              },
              child: Container(
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: !_isKhrFirst ? BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2,
                          ),
                        ],
                      ) : null,
                      child: Text(AppLocalizations.of(context)?.currencyUsd ?? 'USD \$', style: AppTheme.labelMd.copyWith(color: !_isKhrFirst ? AppColors.primary : AppColors.onSurfaceVariant)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: _isKhrFirst ? BoxDecoration(
                        color: AppColors.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2,
                          ),
                        ],
                      ) : null,
                      child: Text(AppLocalizations.of(context)?.currencyKhr ?? 'KHR ៛', style: AppTheme.labelMd.copyWith(color: _isKhrFirst ? AppColors.primary : AppColors.onSurfaceVariant)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StatisticsHeader(
                activePeriod: _activePeriod,
                onPeriodChanged: (period) => setState(() => _activePeriod = period),
              ),
              const SizedBox(height: 16),
              TotalSpendingSummary(activePeriod: _activePeriod, isKhrFirst: _isKhrFirst),
              const SizedBox(height: 16),
              CategoryBreakdownChart(activePeriod: _activePeriod, isKhrFirst: _isKhrFirst),
              const SizedBox(height: 16),
              SpendingTrendChart(activePeriod: _activePeriod, isKhrFirst: _isKhrFirst),
              const SizedBox(height: 16),
              TopCategorySpotlight(activePeriod: _activePeriod, isKhrFirst: _isKhrFirst),
              const SizedBox(height: 16),
              BudgetHealthCard(activePeriod: _activePeriod, isKhrFirst: _isKhrFirst),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      height: 75,
      padding: EdgeInsets.zero,
      color: AppColors.surfaceContainerLowest.withOpacity(0.9),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.dashboard, AppLocalizations.of(context)?.navHome ?? 'Home', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
          }),
          _buildNavItem(context, Icons.query_stats, AppLocalizations.of(context)?.navAnalytics ?? 'Analytics', true, () {}),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(context, Icons.account_balance_wallet, AppLocalizations.of(context)?.navWallets ?? 'Wallets', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const WalletsScreen()),
            );
          }),
          _buildNavItem(context, Icons.settings, AppLocalizations.of(context)?.navSettings ?? 'Settings', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isActive, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? AppColors.primary : AppColors.onSurfaceVariant),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTheme.labelSm.copyWith(
                color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: 6,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
