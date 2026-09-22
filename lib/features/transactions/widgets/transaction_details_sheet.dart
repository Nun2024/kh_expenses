import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class TransactionDetailsSheet extends StatelessWidget {
  const TransactionDetailsSheet({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TransactionDetailsSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.outlineVariant.withOpacity(0.6),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('Transaction Details', style: AppTheme.headlineSm),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.close, size: 20),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const Divider(height: 24),
          // Hero
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.errorContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              'Expense',
              style: AppTheme.labelSm.copyWith(color: AppColors.onErrorContainer),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('-\$5.50', style: AppTheme.displayHeroMobile),
              const SizedBox(width: 4),
              Text('USD', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurfaceVariant)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            '≈ ៛22,468 KHR',
            style: AppTheme.currencySecondary.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Divider(height: 24),
          // Details
          _buildDetailRow('Category', '🍜 Food & Dining'),
          const SizedBox(height: 8),
          _buildDetailRow(
            'Payment Method',
            'Bakong KHQR',
            valueColor: AppColors.primary,
            icon: Icons.check_circle,
          ),
          const SizedBox(height: 8),
          _buildDetailRow('Date & Time', 'Sep 21, 2026 • 12:30 PM'),
          const SizedBox(height: 8),
          _buildDetailRow('Note', 'Lunch with friends at Toul Tompoung'),
          const SizedBox(height: 8),
          _buildDetailRow(
            'Exchange Rate',
            '\$1.00 = ៛4,085 (NBC)',
            valueColor: AppColors.secondary,
            icon: Icons.currency_exchange,
          ),
          const SizedBox(height: 24),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text('Edit Expense'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, size: 18),
                  label: const Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.errorContainer,
                    foregroundColor: AppColors.onErrorContainer,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? valueColor, IconData? icon}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 14, color: valueColor ?? AppColors.onSurface),
                const SizedBox(width: 4),
              ],
              Flexible(
                child: Text(
                  value,
                  style: AppTheme.bodySm.copyWith(
                    color: valueColor ?? AppColors.onSurface,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
