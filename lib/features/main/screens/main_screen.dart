import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../statistics/screens/statistics_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../expenses/screens/add_expense_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    DashboardScreen(),
    StatisticsScreen(),
    Center(child: Text('Wallets Screen')), // Placeholder for Wallets
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildSharedAppBar(),
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _screens,
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

  PreferredSizeWidget _buildSharedAppBar() {
    String title = 'KH Expense';
    String subtitle = 'Smart Ledger';
    bool showAvatar = true;

    if (_currentIndex == 3) {
      title = 'Settings';
      subtitle = 'NBC Rate Synced Today';
      showAvatar = false;
    } else if (_currentIndex == 1) {
      title = 'Analytics';
      subtitle = 'Spending Insights';
      showAvatar = false;
    }

    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColors.surface.withOpacity(0.95),
      elevation: 0,
      title: Row(
        children: [
          if (showAvatar)
            Container(
              margin: const EdgeInsets.only(right: 12),
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
            )
          else if (_currentIndex == 3)
            Container(
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.primary.withOpacity(0.2)),
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: AppColors.secondaryContainer,
                backgroundImage: NetworkImage(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuB5B_pX4g1UF5oLHHEE63-sMmkiA5qLef1lkI8yMQ9cIYVWw95vyStJoQ_tkz6vK4TxzUPnQ0yVQtVr-lx3UchyyG1xCCVKg_W7V2tBTsdX7Dy8iOuTt90lma_uof0eXT70oHbbvsh_TbpI4e9ryQbG2PBrdU1Hw5DuCemtv3TLQdB_7EiyCX4LwqQ7Q3e28I9Y-A1Jv-G07J04qHp551_K07wHL7vODTw57NDJbNxN788ZK6qbiDmA',
                ),
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: _currentIndex == 3 
                    ? AppTheme.headlineMd.copyWith(color: AppColors.primary)
                    : AppTheme.headlineMd.copyWith(color: AppColors.onSurface),
              ),
              if (_currentIndex == 3)
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      subtitle,
                      style: AppTheme.labelSm.copyWith(color: AppColors.outline),
                    ),
                  ],
                )
              else
                Text(
                  subtitle,
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
            color: _currentIndex == 3 ? AppColors.surfaceContainer : AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
          ),
          child: _currentIndex == 3 
            ? Row(
                children: [
                  Text('USD \$', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text('/', style: TextStyle(color: AppColors.outline, fontSize: 12)),
                  ),
                  Text('៛', style: AppTheme.labelMd.copyWith(color: AppColors.tertiary)),
                ],
              )
            : Row(
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
          _buildNavItem(0, Icons.dashboard, 'Home'),
          _buildNavItem(1, Icons.query_stats, 'Analytics'),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(2, Icons.account_balance_wallet, 'Wallets'),
          _buildNavItem(3, Icons.settings, 'Settings'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isActive = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
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
