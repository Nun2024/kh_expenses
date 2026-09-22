import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../widgets/spending_card.dart';
import '../widgets/quick_stats_grid.dart';
import '../widgets/category_breakdown.dart';
import '../widgets/recent_transactions.dart';
import '../../expenses/screens/add_expense_screen.dart';
import '../../transactions/screens/transactions_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _selectedPeriod = 'This Month';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.surface.withOpacity(0.95),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ColorFilter.mode(Colors.transparent, BlendMode.clear), // Mock backdrop blur
            child: Container(color: Colors.transparent),
          ),
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary.withOpacity(0.2), width: 2),
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuDp3OqCQJDTL7_wrMQv9HL-S_uH3l1FuolNdjySqiInRThHZ5QrWsGBF4bDyCJgz_bwdBTv3nePOsgGdOpRKzEkaQ4JOI60I4W4cLZE2MCErh-yD80LPrK7g-QZNnV6zVlTK4w7_2N3kwevQHyLGJ3OAb8ivsHT_NLCd73lRqMfaHPLhfsZWge_KFiv2zfJuJzgTq4dDPofJGBqt_C0pXrpyZfwZrmiVLsbRAsOKMM',
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
                  style: AppTheme.headlineMd.copyWith(color: AppColors.primary),
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 12, color: AppColors.outline),
                    const SizedBox(width: 4),
                    Text(
                      'Phnom Penh • Synced',
                      style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
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
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Text('USD \$', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text('KHR ៛', style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
                  ),
                ],
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
              // User Greeting & Period Filter Pill Strip
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good evening, Nun 👋',
                        style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Track dual spending in real time',
                        style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primaryFixed.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.bolt, size: 14, color: AppColors.primary),
                        const SizedBox(width: 4),
                        Text(
                          'Fast Log',
                          style: AppTheme.labelSm.copyWith(color: AppColors.primary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Segmented Period Selector
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildSegmentButton(
                        'Today', 
                        _selectedPeriod == 'Today',
                        () => setState(() => _selectedPeriod = 'Today'),
                      ),
                    ),
                    Expanded(
                      child: _buildSegmentButton(
                        'This Week', 
                        _selectedPeriod == 'This Week',
                        () => setState(() => _selectedPeriod = 'This Week'),
                      ),
                    ),
                    Expanded(
                      child: _buildSegmentButton(
                        'This Month', 
                        _selectedPeriod == 'This Month',
                        () => setState(() => _selectedPeriod = 'This Month'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              
              // Hero Card
              const SpendingCard(),
              const SizedBox(height: 12),

              const QuickStatsGrid(),
              const SizedBox(height: 12),

              const CategoryBreakdown(),
              const SizedBox(height: 12),

              const RecentTransactions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
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

  Widget _buildSegmentButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
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
        alignment: Alignment.center,
        child: Text(
          text,
          style: AppTheme.labelMd.copyWith(
            color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w700 : null,
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      height: 75,
      padding: EdgeInsets.zero,
      color: AppColors.surfaceContainerLowest.withOpacity(0.9),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.dashboard, 'Home', true, () {}),
          _buildNavItem(Icons.query_stats, 'Analytics', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const TransactionsScreen()),
            );
          }),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(Icons.account_balance_wallet, 'Wallets', false, () {}),
          _buildNavItem(Icons.settings, 'Settings', false, () {}),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, VoidCallback onTap) {
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
