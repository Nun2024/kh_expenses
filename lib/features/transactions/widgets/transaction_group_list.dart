import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'transaction_list_item.dart';

class TransactionGroupList extends StatelessWidget {
  final VoidCallback onTransactionTap;
  
  const TransactionGroupList({super.key, required this.onTransactionTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDateGroup(
          'Today, September 21, 2026',
          '-\$7.50 • ៛30,600',
          true,
          [
            TransactionListItem(
              title: 'Khmer Noodle Lunch (Nom Banh Chok)',
              subtitle: 'Lunch with friends',
              time: '12:30 PM',
              amountStr: '-\$5.50',
              amountKhr: '៛22,500',
              emoji: '🍜',
              iconBgColor: AppColors.primary.withOpacity(0.1),
              paymentMethod: 'Bakong KHQR',
              paymentIcon: Icons.qr_code_2,
              paymentBgColor: AppColors.primaryFixed.withOpacity(0.3),
              paymentTextColor: AppColors.onPrimaryFixedVariant,
              onTap: onTransactionTap,
            ),
            const SizedBox(height: 8),
            TransactionListItem(
              title: 'PassApp Rickshaw to BKK1',
              time: '10:20 AM',
              amountStr: '-\$2.00',
              amountKhr: '៛8,200',
              emoji: '🚕',
              iconBgColor: AppColors.tertiary.withOpacity(0.1),
              paymentMethod: 'Bakong KHQR',
              paymentIcon: Icons.qr_code_2,
              paymentBgColor: AppColors.primaryFixed.withOpacity(0.3),
              paymentTextColor: AppColors.onPrimaryFixedVariant,
              onTap: onTransactionTap,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildDateGroup(
          'Yesterday, September 20, 2026',
          '-\$22.70 • ៛92,700',
          false,
          [
            TransactionListItem(
              title: 'Cotton T-Shirt (Russian Market)',
              subtitle: 'Weekend market',
              time: '4:20 PM',
              amountStr: '-\$15.00',
              amountKhr: '៛61,300',
              emoji: '🛍',
              iconBgColor: AppColors.surfaceContainer,
              paymentMethod: 'Cash (US\$)',
              paymentIcon: Icons.payments,
              paymentBgColor: AppColors.surfaceContainer,
              paymentTextColor: AppColors.onSurfaceVariant,
              onTap: onTransactionTap,
            ),
            const SizedBox(height: 8),
            TransactionListItem(
              title: 'Family Dinner at Sovanna BBQ',
              time: '7:30 PM',
              amountStr: '-\$4.50',
              amountKhr: '៛18,400',
              emoji: '🍜',
              iconBgColor: AppColors.primary.withOpacity(0.1),
              paymentMethod: 'ABA Pay',
              paymentIcon: Icons.account_balance,
              paymentBgColor: const Color(0xFFE0F2FE),
              paymentTextColor: const Color(0xFF0369A1),
              onTap: onTransactionTap,
            ),
          ],
        ),
      ],
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
