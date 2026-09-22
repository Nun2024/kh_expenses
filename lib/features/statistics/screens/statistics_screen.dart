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

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  String _activePeriod = 'Month';

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
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB6ZzaGfdcxOMYpy1K8prr5TLf4YVyJ4zs9YMLaf3MJaBDobFlR-dhGUJyIwj8DocLDxKfgWNzooCd1Gi67w6mEYpgPT5hzJOFp0R9xMj9PwDZt0OoA87xZsGWQ2u7ZVpDjWG5AoHNB-Jgv7kdDlAfwurvpKs2ftqD3RjwdWXEzOUYMT-RrjmUAuOmSZjmRic-dOe9WdUZWVR_pvWwzVx48rs4wddajd9AnaZ_V7jgNct0Q6P8RC-OZ',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'KH Expense',
                  style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface),
                ),
                Text(
                  'Smart Ledger',
                  style: AppTheme.labelSm.copyWith(color: AppColors.outline),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                ),
                const SizedBox(width: 6),
                Text('USD \$ / ៛', style: AppTheme.labelSm.copyWith(color: AppColors.primary)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('•', style: TextStyle(color: AppColors.outlineVariant, fontSize: 10)),
                ),
                Text('៛4,085', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500)),
              ],
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
              const TotalSpendingSummary(),
              const SizedBox(height: 16),
              const CategoryBreakdownChart(),
              const SizedBox(height: 16),
              const SpendingTrendChart(),
              const SizedBox(height: 16),
              const TopCategorySpotlight(),
              const SizedBox(height: 16),
              const BudgetHealthCard(),
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
          _buildNavItem(context, Icons.dashboard, 'Home', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
          }),
          _buildNavItem(context, Icons.query_stats, 'Analytics', true, () {}),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(context, Icons.account_balance_wallet, 'Wallets', false, () {}),
          _buildNavItem(context, Icons.settings, 'Settings', false, () {
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
