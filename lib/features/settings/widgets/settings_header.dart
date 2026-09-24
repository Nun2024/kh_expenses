import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class SettingsHeader extends StatelessWidget implements PreferredSizeWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColors.surface.withOpacity(0.95),
      elevation: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.secondaryContainer,
              backgroundImage: AssetImage(
                'assets/profiles/profiles.webp',
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppLocalizations.of(context)?.settingsTitle ?? 'Settings',
                style: AppTheme.headlineMd.copyWith(color: AppColors.primary),
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppLocalizations.of(context)?.nbcRateSyncedToday ?? 'NBC Rate Synced Today',
                    style: AppTheme.labelSm.copyWith(color: AppColors.outline),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Text(AppLocalizations.of(context)?.usdAndKhr ?? 'USD \$ / ៛', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
