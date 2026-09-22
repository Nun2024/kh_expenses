import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class NbcRateBanner extends StatelessWidget {
  const NbcRateBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.currency_exchange, size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('National Bank of Cambodia Rate', style: AppTheme.labelMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Text('\$1.00 USD = ', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                      Text('៛4,085.00 KHR', style: AppTheme.bodySm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'SYNCED LIVE',
              style: AppTheme.labelSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold, letterSpacing: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
