import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class TransactionListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final String amountStr;
  final String amountKhr;
  final String emoji;
  final Color iconBgColor;
  final String paymentMethod;
  final IconData paymentIcon;
  final Color paymentBgColor;
  final Color paymentTextColor;
  final VoidCallback onTap;

  const TransactionListItem({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.time,
    required this.amountStr,
    required this.amountKhr,
    required this.emoji,
    required this.iconBgColor,
    required this.paymentMethod,
    required this.paymentIcon,
    required this.paymentBgColor,
    required this.paymentTextColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 3,
              offset: const Offset(0, 1),
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
                      color: iconBgColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(emoji, style: const TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: AppTheme.bodyMd.copyWith(fontWeight: FontWeight.w600, color: AppColors.onSurface),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '$time${subtitle.isNotEmpty ? ' • $subtitle' : ''}',
                          style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: paymentBgColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(paymentIcon, size: 10, color: paymentTextColor),
                              const SizedBox(width: 4),
                              Text(
                                paymentMethod,
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: paymentTextColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amountStr,
                  style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface),
                ),
                const SizedBox(height: 2),
                Text(
                  amountKhr,
                  style: AppTheme.bodySm.copyWith(fontWeight: FontWeight.w500, color: AppColors.onSurfaceVariant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
