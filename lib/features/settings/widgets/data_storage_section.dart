import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class DataStorageSection extends StatelessWidget {
  const DataStorageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)?.settingsDataStorageTitle ?? 'DATA & STORAGE', style: AppTheme.labelMd.copyWith(color: AppColors.outline, fontWeight: FontWeight.bold)),
              Text(AppLocalizations.of(context)?.settingsLocalSqlite ?? 'Local SQLite Cache', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
            ],
          ),
        ),
        Container(
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
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.storage, color: AppColors.onSurfaceVariant, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppLocalizations.of(context)?.settingsEncryptedDb ?? 'Encrypted Local Database', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                            Text(AppLocalizations.of(context)?.settingsDataUsed ?? '48 Transactions • 2.4 MB Used', style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
                          ],
                        ),
                      ],
                    ),
                    Text(AppLocalizations.of(context)?.settingsAutoBacked ?? 'Auto-backed', style: AppTheme.labelMd.copyWith(color: AppColors.outline, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Divider(height: 1, color: AppColors.outlineVariant.withOpacity(0.2)),
              InkWell(
                onTap: () {},
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppColors.errorContainer.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.delete_sweep, color: AppColors.error, size: 20),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)?.settingsClearAllData ?? 'Clear All Data', style: AppTheme.headlineSm.copyWith(color: AppColors.error, fontWeight: FontWeight.w600)),
                              Text(AppLocalizations.of(context)?.settingsResetDataDesc ?? 'Reset transactions, custom limits, and cache', style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(AppLocalizations.of(context)?.settingsDanger ?? 'Reset', style: AppTheme.labelMd.copyWith(color: AppColors.error, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
