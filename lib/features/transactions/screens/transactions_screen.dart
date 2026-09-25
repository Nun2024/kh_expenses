import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../expenses/screens/add_expense_screen.dart';
import '../../statistics/screens/statistics_screen.dart';
import '../../wallets/screens/wallets_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../widgets/transaction_header.dart';
import '../widgets/transaction_filters.dart';
import '../widgets/transaction_group_list.dart';
import '../widgets/transaction_details_sheet.dart';
import 'package:kh_expense/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../expenses/providers/expense_provider.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  bool _isKhrFirst = false;
  String _selectedTime = 'This Month';
  String _selectedCategory = 'All';
  String _searchQuery = '';
  DateTimeRange? _customDateRange;

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();
    var expenses = provider.recentExpenses;

    if (_selectedCategory != 'All') {
      expenses = expenses.where((e) => e.category == _selectedCategory).toList();
    }

    if (_searchQuery.isNotEmpty) {
      final lowerQuery = _searchQuery.toLowerCase();
      expenses = expenses.where((e) {
        return (e.notes?.toLowerCase().contains(lowerQuery) ?? false) ||
               (e.category.toLowerCase().contains(lowerQuery));
      }).toList();
    }

    final now = DateTime.now();
    if (_selectedTime == 'Today') {
      expenses = expenses.where((e) => 
        e.date.year == now.year && e.date.month == now.month && e.date.day == now.day
      ).toList();
    } else if (_selectedTime == 'This Month') {
      expenses = expenses.where((e) => 
        e.date.year == now.year && e.date.month == now.month
      ).toList();
    } else if (_selectedTime == 'This Week') {
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      expenses = expenses.where((e) => 
        e.date.isAfter(startOfWeek.subtract(const Duration(days: 1))) && 
        e.date.isBefore(now.add(const Duration(days: 1)))
      ).toList();
    } else if (_selectedTime == 'Custom' && _customDateRange != null) {
      expenses = expenses.where((e) =>
        e.date.isAfter(_customDateRange!.start.subtract(const Duration(days: 1))) &&
        e.date.isBefore(_customDateRange!.end.add(const Duration(days: 1)))
      ).toList();
    }

    double totalUsd = 0;
    double totalKhr = 0;
    for (var e in expenses) {
      totalUsd += e.usdAmount;
      totalKhr += e.khrAmount;
    }

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
            Text(
              'KH Expense',
              style: AppTheme.headlineMd.copyWith(color: AppColors.primary),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
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
                          )
                        ]
                      ) : null,
                      child: Text('USD \$', style: AppTheme.labelSm.copyWith(color: !_isKhrFirst ? AppColors.primary : AppColors.outline)),
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
                          )
                        ]
                      ) : null,
                      child: Text('៛ KHR', style: AppTheme.labelSm.copyWith(color: _isKhrFirst ? AppColors.tertiary : AppColors.outline)),
                    ),
                  ],
                ),
              ),
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
              TransactionHeader(totalCount: provider.recentExpenses.length),
              const SizedBox(height: 16),
              TransactionFilters(
                selectedTime: _selectedTime,
                onTimeChanged: (val) async {
                  if (val == 'Custom') {
                    final picked = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now().add(const Duration(days: 365)),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: AppColors.primary,
                              onPrimary: Colors.white,
                              onSurface: AppColors.onSurface,
                            ),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (picked != null) {
                      setState(() {
                        _customDateRange = picked;
                        _selectedTime = val;
                      });
                    }
                  } else {
                    setState(() {
                      _selectedTime = val;
                      _customDateRange = null;
                    });
                  }
                },
                selectedCategory: _selectedCategory,
                onCategoryChanged: (val) => setState(() => _selectedCategory = val),
                searchQuery: _searchQuery,
                onSearchChanged: (val) => setState(() => _searchQuery = val),
                filteredTotalUsd: totalUsd,
                filteredTotalKhr: totalKhr,
                filteredCount: expenses.length,
                isKhrFirst: _isKhrFirst,
              ),
              const SizedBox(height: 24),
              TransactionGroupList(
                isKhrFirst: _isKhrFirst,
                expenses: expenses,
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
          _buildNavItem(context, Icons.dashboard, AppLocalizations.of(context)?.navHome ?? 'Home', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
          }),
          _buildNavItem(context, Icons.query_stats, AppLocalizations.of(context)?.navAnalytics ?? 'Analytics', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StatisticsScreen()));
          }),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(context, Icons.account_balance_wallet, AppLocalizations.of(context)?.navWallets ?? 'Wallets', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WalletsScreen()));
          }),
          _buildNavItem(context, Icons.settings, AppLocalizations.of(context)?.navSettings ?? 'Settings', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
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
