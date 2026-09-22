import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text('Recent Transactions', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  Text('View All', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
                  const Icon(Icons.arrow_forward, size: 16, color: AppColors.primary),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildTransactionItem(
          emoji: '🍜',
          bgColor: AppColors.tertiaryFixed.withOpacity(0.4),
          title: 'Khmer Noodle Soup (Nom Banh Chok)',
          time: '12:45 PM',
          method: 'Cash',
          methodBgColor: AppColors.surfaceContainer,
          methodColor: AppColors.onSurfaceVariant,
          usdAmount: '-\$4.50',
          khrAmount: '៛18,500',
        ),
        const SizedBox(height: 10),
        _buildTransactionItem(
          emoji: '🚕',
          bgColor: AppColors.primaryFixed.withOpacity(0.4),
          title: 'PassApp Rickshaw',
          time: '9:15 AM',
          method: 'ABA Pay',
          methodBgColor: AppColors.primaryFixed.withOpacity(0.3),
          methodColor: AppColors.primary,
          usdAmount: '-\$2.00',
          khrAmount: '៛8,200',
        ),
        const SizedBox(height: 10),
        _buildTransactionItem(
          emoji: '☕',
          bgColor: AppColors.tertiaryContainer.withOpacity(0.2),
          title: 'Brown Coffee / Iced Latte',
          time: '8:30 AM',
          method: 'Bakong KHQR',
          methodBgColor: AppColors.errorContainer.withOpacity(0.4),
          methodColor: AppColors.error,
          usdAmount: '-\$2.50',
          khrAmount: '៛10,200',
        ),
        const SizedBox(height: 10),
        _buildTransactionItem(
          emoji: '🛒',
          bgColor: AppColors.secondaryFixed.withOpacity(0.4),
          title: 'Aeon Mart Groceries',
          time: 'Yesterday',
          method: 'Wing',
          methodBgColor: AppColors.secondaryContainer.withOpacity(0.6),
          methodColor: AppColors.onSecondaryContainer,
          usdAmount: '-\$18.20',
          khrAmount: '៛74,500',
        ),
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
    required String usdAmount,
    required String khrAmount,
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
              Text(usdAmount, style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w700)),
              Text(khrAmount, style: AppTheme.currencySecondary.copyWith(color: AppColors.outline)),
            ],
          ),
        ],
      ),
    );
  }
}
