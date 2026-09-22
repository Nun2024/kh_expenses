import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class WalletActivitySheet extends StatelessWidget {
  const WalletActivitySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(width: 10, height: 10, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                  const SizedBox(width: 8),
                  Text('ABA Activity & Quick Flow', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                ],
              ),
              Text('September 2024', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monthly Received', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                      Text('+\$1,200.00', style: AppTheme.headlineSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monthly Spent', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                      Text('-\$350.00', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          Text('RECENT ABA TRANSACTIONS', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
          const SizedBox(height: 8),
          
          _buildTransactionItem(
            icon: Icons.work,
            iconColor: AppColors.secondary,
            bgColor: AppColors.secondaryFixed.withOpacity(0.3),
            title: 'Salary Deposit',
            subtitle: 'Sep 01 • ABA Direct Transfer',
            amountUsd: '+\$1,200.00',
            amountKhr: '៛4,902,000',
            isPositive: true,
          ),
          _buildTransactionItem(
            icon: Icons.restaurant,
            iconColor: AppColors.tertiary,
            bgColor: AppColors.tertiaryFixed.withOpacity(0.4),
            title: 'Lunch with friends',
            subtitle: 'Sep 21 • Bakong KHQR',
            amountUsd: '-\$5.00',
            amountKhr: '៛20,425',
          ),
          _buildTransactionItem(
            icon: Icons.local_taxi,
            iconColor: AppColors.primary,
            bgColor: AppColors.surfaceContainerHigh,
            title: 'PassApp Rickshaw',
            subtitle: 'Sep 21 • KHQR Scan',
            amountUsd: '-\$3.00',
            amountKhr: '៛12,255',
          ),
          _buildTransactionItem(
            icon: Icons.shopping_bag,
            iconColor: AppColors.onSurface,
            bgColor: AppColors.surfaceContainerHigh,
            title: 'Russian Market Shopping',
            subtitle: 'Sep 20 • ABA Merchant',
            amountUsd: '-\$25.00',
            amountKhr: '៛102,125',
          ),
          
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: AppColors.surfaceContainerLow,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('View Full Statement', style: AppTheme.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_forward, size: 16, color: AppColors.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String title,
    required String subtitle,
    required String amountUsd,
    required String amountKhr,
    bool isPositive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(12)),
                child: Icon(icon, size: 18, color: iconColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amountUsd,
                style: AppTheme.headlineSm.copyWith(
                  color: isPositive ? AppColors.secondary : AppColors.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(amountKhr, style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
            ],
          ),
        ],
      ),
    );
  }
}
