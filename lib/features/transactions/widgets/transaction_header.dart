import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class TransactionHeader extends StatelessWidget {
  final int totalCount;
  const TransactionHeader({super.key, required this.totalCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Transactions',
                style: AppTheme.headlineLg.copyWith(color: AppColors.onSurface),
              ),
              const SizedBox(height: 2),
              Row(
                children: [
                  const Icon(Icons.receipt_long, size: 14, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text(
                    '$totalCount expenses logged this month',
                    style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                Text(
                  'NBC',
                  style: AppTheme.labelSm.copyWith(color: AppColors.outline, fontSize: 10),
                ),
                const SizedBox(width: 4),
                Text(
                  '\$1 = ៛4,085',
                  style: AppTheme.labelMd.copyWith(color: AppColors.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
