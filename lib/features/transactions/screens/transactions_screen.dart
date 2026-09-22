import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../expenses/screens/add_expense_screen.dart';
import '../widgets/transaction_header.dart';
import '../widgets/transaction_filters.dart';
import '../widgets/transaction_group_list.dart';
import '../widgets/transaction_details_sheet.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

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
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB1_Z4PpBqbk9Gvjxl_fZ56k_zU0CBTKjp9770Jd-_66BFdhGxUg1BN3nun5BQtGc42wTgEYJTbujopNJNvrw-MiLH-O3D6A80CHRDvCAfaVDVsjBEEvdrrfc8xFUcWnlCX6pmeAk3yWOopenbwaWNnmoyLzm0qyranccOpGb1N_ghyGvY0U_Sr6nDCqlkya9zpNyM1wdciZQYPinc4vNDq2nmvRk55BCp9SUdgzp6NaACtv8uQR-GN',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'KH Expense',
              style: AppTheme.headlineMd.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                ),
                const SizedBox(width: 4),
                Text('USD \$ / ៛', style: AppTheme.labelSm.copyWith(color: AppColors.primary)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.ios_share, color: AppColors.onSurfaceVariant, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TransactionHeader(),
              const SizedBox(height: 16),
              const TransactionFilters(),
              const SizedBox(height: 24),
              TransactionGroupList(
                onTransactionTap: () => TransactionDetailsSheet.show(context),
              ),
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
          _buildNavItem(context, Icons.settings, 'Settings', false, () {}),
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
