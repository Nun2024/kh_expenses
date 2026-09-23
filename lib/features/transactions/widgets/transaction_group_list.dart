import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'transaction_list_item.dart';
import 'package:provider/provider.dart';
import '../../expenses/providers/expense_provider.dart';
import 'package:intl/intl.dart';

class TransactionGroupList extends StatelessWidget {
  final VoidCallback onTransactionTap;
  
  const TransactionGroupList({super.key, required this.onTransactionTap});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();
    final expenses = provider.recentExpenses;

    if (expenses.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text('No transactions yet.', style: AppTheme.bodyMd.copyWith(color: AppColors.outline)),
        ),
      );
    }

    // Group expenses by date string
    final Map<String, List<dynamic>> grouped = {};
    for (var exp in expenses) {
      final dateStr = DateFormat('MMMM d, yyyy').format(exp.date);
      if (!grouped.containsKey(dateStr)) {
        grouped[dateStr] = [];
      }
      grouped[dateStr]!.add(exp);
    }

    final todayStr = DateFormat('MMMM d, yyyy').format(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: grouped.entries.map((entry) {
        final dateLabel = entry.key == todayStr ? 'Today, ${entry.key}' : entry.key;
        
        double totalUsd = 0;
        double totalKhr = 0;
        for (var e in entry.value) {
          totalUsd += e.usdAmount;
          totalKhr += e.khrAmount;
        }
        
        final totalStr = '-\$${totalUsd.toStringAsFixed(2)} • ៛${NumberFormat('#,###').format(totalKhr.round())}';
        
        return _buildDateGroup(
          dateLabel,
          totalStr,
          entry.key == todayStr,
          entry.value.map((expense) {
            String emoji = '📦';
            Color iconBgColor = AppColors.surfaceContainer;
            if (expense.category == 'Food') {
              emoji = '🍜';
              iconBgColor = AppColors.tertiaryFixed.withOpacity(0.2);
            } else if (expense.category == 'Transport') {
              emoji = '🚕';
              iconBgColor = AppColors.primaryFixed.withOpacity(0.2);
            } else if (expense.category == 'Shopping') {
              emoji = '🛍';
              iconBgColor = AppColors.secondaryFixed.withOpacity(0.2);
            }

            Color mBgColor = AppColors.surfaceContainer;
            Color mColor = AppColors.onSurfaceVariant;
            if (expense.paymentMethod.contains('ABA')) {
              mBgColor = AppColors.primaryFixed.withOpacity(0.3);
              mColor = AppColors.primary;
            } else if (expense.paymentMethod.contains('Bakong')) {
              mBgColor = AppColors.errorContainer.withOpacity(0.4);
              mColor = AppColors.error;
            } else if (expense.paymentMethod.contains('Wing')) {
              mBgColor = AppColors.secondaryContainer.withOpacity(0.6);
              mColor = AppColors.onSecondaryContainer;
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TransactionListItem(
                title: expense.notes ?? expense.category,
                subtitle: expense.category,
                time: DateFormat('h:mm a').format(expense.date),
                amountStr: '-\$${expense.usdAmount.toStringAsFixed(2)}',
                amountKhr: '៛${NumberFormat('#,###').format(expense.khrAmount.round())}',
                emoji: emoji,
                iconBgColor: iconBgColor,
                paymentMethod: expense.paymentMethod,
                paymentIcon: Icons.payment,
                paymentBgColor: mBgColor,
                paymentTextColor: mColor,
                onTap: onTransactionTap,
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  Widget _buildDateGroup(String date, String total, bool isToday, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (isToday) ...[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    date,
                    style: AppTheme.labelMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                total,
                style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11),
              ),
            ],
          ),
        ),
        ...items,
      ],
    );
  }
}
