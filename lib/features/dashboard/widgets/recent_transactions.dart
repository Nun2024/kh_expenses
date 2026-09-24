import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../transactions/screens/transactions_screen.dart';
import 'package:kh_expense/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../expenses/providers/expense_provider.dart';
import 'package:intl/intl.dart';

class RecentTransactions extends StatelessWidget {
  final bool isKhrFirst;
  const RecentTransactions({super.key, this.isKhrFirst = false});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ExpenseProvider>();
    final recent = provider.recentExpenses.take(4).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(width: 8),
                Text(AppLocalizations.of(context)?.recentTransactions ?? 'Recent Transactions', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TransactionsScreen()),
                );
              },
              child: Row(
                children: [
                  Text(AppLocalizations.of(context)?.viewAll ?? 'View All', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
                  const Icon(Icons.arrow_forward, size: 16, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (recent.isEmpty)
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(
                'No transactions yet.',
                style: AppTheme.bodyMd.copyWith(color: AppColors.outline),
              ),
            ),
          )
        else
          ...recent.map((expense) {
            final khrFormatted = NumberFormat('#,###').format(expense.khrAmount.round());
            final usdFormatted = expense.usdAmount.toStringAsFixed(2);
            final timeFormatted = DateFormat('h:mm a').format(expense.date);
            
            // Map category to emoji/color for demo
            String emoji = '📦';
            Color bgColor = AppColors.surfaceContainerHigh;
            if (expense.category == 'Food') {
              emoji = '🍜';
              bgColor = AppColors.tertiaryFixed.withOpacity(0.4);
            } else if (expense.category == 'Transport') {
              emoji = '🚕';
              bgColor = AppColors.primaryFixed.withOpacity(0.4);
            } else if (expense.category == 'Shopping') {
              emoji = '🛒';
              bgColor = AppColors.secondaryFixed.withOpacity(0.4);
            }
            
            // Map payment method to color
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
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildTransactionItem(
                emoji: emoji,
                bgColor: bgColor,
                title: expense.notes ?? expense.category,
                time: timeFormatted,
                method: expense.paymentMethod,
                methodBgColor: mBgColor,
                methodColor: mColor,
                primaryAmount: isKhrFirst ? '៛$khrFormatted' : '-\$$usdFormatted',
                secondaryAmount: isKhrFirst ? '-\$$usdFormatted' : '៛$khrFormatted',
              ),
            );
          }),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String emoji,
    required Color bgColor,
    required String title,
    required String time,
    required String method,
    required Color methodBgColor,
    required Color methodColor,
    required String primaryAmount,
    required String secondaryAmount,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(emoji, style: const TextStyle(fontSize: 18)),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(time, style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            width: 4,
                            height: 4,
                            decoration: const BoxDecoration(
                              color: AppColors.outlineVariant,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: methodBgColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(method, style: AppTheme.labelSm.copyWith(color: methodColor, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(primaryAmount, style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w700)),
              Text(secondaryAmount, style: AppTheme.currencySecondary.copyWith(color: AppColors.outline)),
            ],
          ),
        ],
      ),
    );
  }
}
