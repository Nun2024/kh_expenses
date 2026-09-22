import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class PaymentMethodList extends StatelessWidget {
  final String activePayment;
  final Function(String) onPaymentSelected;

  const PaymentMethodList({
    super.key,
    required this.activePayment,
    required this.onPaymentSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Payment Method', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
            Row(
              children: [
                const Icon(Icons.verified, size: 14, color: AppColors.secondary),
                const SizedBox(width: 4),
                Text('KHQR Ready', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              _buildPaymentPill(
                'Bakong KHQR',
                Icons.qr_code_scanner,
                activePayment == 'Bakong KHQR',
                isFast: true,
              ),
              const SizedBox(width: 8),
              _buildPaymentPill(
                'Cash (US\$ / ៛)',
                Icons.payments,
                activePayment == 'Cash (US\$ / ៛)',
              ),
              const SizedBox(width: 8),
              _buildPaymentPill(
                'ABA Pay',
                null, // Text icon for ABA
                activePayment == 'ABA Pay',
                customIconText: 'ABA',
              ),
              const SizedBox(width: 8),
              _buildPaymentPill(
                'ACLEDA',
                Icons.account_balance,
                activePayment == 'ACLEDA',
              ),
              const SizedBox(width: 8),
              _buildPaymentPill(
                'Wing Bank',
                Icons.bolt,
                activePayment == 'Wing Bank',
              ),
              const SizedBox(width: 8),
              _buildPaymentPill(
                'Bank Transfer',
                Icons.sync_alt,
                activePayment == 'Bank Transfer',
              ),
              const SizedBox(width: 8),
              _buildPaymentPill(
                'Other',
                Icons.more_horiz,
                activePayment == 'Other',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentPill(String name, IconData? icon, bool isSelected, {bool isFast = false, String? customIconText}) {
    return GestureDetector(
      onTap: () => onPaymentSelected(name),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.4),
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2)]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(right: 8),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: AppColors.primaryFixed,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                ),
              )
            else
              Container(
                margin: const EdgeInsets.only(right: 8),
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.outlineVariant,
                  shape: BoxShape.circle,
                ),
              ),
            if (customIconText != null)
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  customIconText,
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppColors.primary),
                ),
              )
            else if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(icon, size: 18, color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant),
              ),
            Text(
              name,
              style: AppTheme.bodyMd.copyWith(
                color: isSelected ? AppColors.onPrimary : AppColors.onSurface,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
            if (isFast)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'FAST',
                  style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.5, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
