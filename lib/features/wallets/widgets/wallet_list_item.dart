import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class WalletListItem extends StatelessWidget {
  final String name;
  final String subtitle;
  final String tagText;
  final Color? tagColor;
  final Color? tagBgColor;
  final IconData? icon;
  final String? initials;
  final String? smallText;
  final Color avatarColor;
  final Color avatarTextColor;
  final String usdBalance;
  final String khrBalance;
  final String transactionCount;
  final bool isSelected;
  final bool isKhqr;

  const WalletListItem({
    super.key,
    required this.name,
    required this.subtitle,
    required this.tagText,
    this.tagColor,
    this.tagBgColor,
    this.icon,
    this.initials,
    this.smallText,
    required this.avatarColor,
    required this.avatarTextColor,
    required this.usdBalance,
    required this.khrBalance,
    required this.transactionCount,
    this.isSelected = false,
    this.isKhqr = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isSelected ? AppColors.primary.withOpacity(0.4) : AppColors.outlineVariant.withOpacity(0.3),
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))]
            : [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          if (isSelected)
            Positioned(
              top: -16,
              right: -16,
              child: Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(100)),
                ),
              ),
            ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: avatarColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: avatarColor.withOpacity(0.2), width: 2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (icon != null) Icon(icon, color: avatarTextColor, size: 20),
                            if (initials != null)
                              Text(
                                initials!,
                                style: TextStyle(
                                  color: avatarTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: icon != null ? 10 : 14,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            if (smallText != null)
                              Text(
                                smallText!,
                                style: TextStyle(
                                  color: avatarTextColor.withOpacity(0.8),
                                  fontFamily: 'monospace',
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(name, style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 6),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: tagBgColor ?? AppColors.surfaceContainer,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  tagText,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: tagColor ?? AppColors.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(subtitle, style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontFamily: 'monospace')),
                        ],
                      ),
                    ],
                  ),
                  if (isKhqr)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEE2737).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xFFEE2737), shape: BoxShape.circle)),
                          const SizedBox(width: 4),
                          const Text('KHQR', style: TextStyle(color: Color(0xFFEE2737), fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  else
                    const Icon(Icons.chevron_right, color: AppColors.outlineVariant, size: 20),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 1),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isSelected)
                        Text('Available Balance', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(usdBalance, style: AppTheme.currencyPrimary.copyWith(color: AppColors.onSurface)),
                          const SizedBox(width: 6),
                          Text('≈ $khrBalance', style: AppTheme.currencySecondary.copyWith(color: isSelected ? AppColors.tertiary : AppColors.onSurfaceVariant)),
                        ],
                      ),
                    ],
                  ),
                  if (isSelected)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryContainer.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        transactionCount,
                        style: AppTheme.labelSm.copyWith(color: AppColors.secondary, fontWeight: FontWeight.bold),
                      ),
                    )
                  else
                    Text(transactionCount, style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
