import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryContainer],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
              ],
            ),
            padding: const EdgeInsets.all(2),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14),
              ),
              alignment: Alignment.center,
              child: Text(
                'KH',
                style: AppTheme.headlineLg.copyWith(color: AppColors.onPrimary, fontWeight: FontWeight.w800, letterSpacing: -1),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text('KH Expense', style: AppTheme.headlineMd.copyWith(fontWeight: FontWeight.w800, color: AppColors.onBackground)),
          Text('Version 1.0.0 (Build 2026.1)', style: AppTheme.bodySm.copyWith(color: AppColors.outline, fontWeight: FontWeight.w500)),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Made with Flutter', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                const SizedBox(width: 6),
                const Text('🇰🇭', style: TextStyle(fontSize: 14)),
                const SizedBox(width: 6),
                Text('• Built for Cambodia', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2))),
            ),
            child: InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.verified_user, size: 15, color: AppColors.primary),
                  const SizedBox(width: 4),
                  Text('Privacy & Offline Guarantee', style: AppTheme.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
