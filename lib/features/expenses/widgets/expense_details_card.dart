import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class ExpenseDetailsCard extends StatelessWidget {
  const ExpenseDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
            ),
            child: Row(
              children: [
                const Icon(Icons.edit_note, size: 20, color: AppColors.onSurfaceVariant),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)?.expenseNotesHint ?? 'Lunch with friends (optional)',
                      hintStyle: AppTheme.bodyMd.copyWith(color: AppColors.outline),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                    style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.calendar_today, size: 20, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(AppLocalizations.of(context)?.dateLabel ?? 'Date:', style: AppTheme.bodyMd.copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
                    ),
                    child: Text(AppLocalizations.of(context)?.mockDate ?? 'Today, Sep 21', style: AppTheme.labelMd.copyWith(color: AppColors.onSurface)),
                  ),
                ],
              ),
              Row(
                children: [
                  _buildDateQuickPick(AppLocalizations.of(context)?.today ?? 'Today', true),
                  const SizedBox(width: 6),
                  _buildDateQuickPick(AppLocalizations.of(context)?.yesterday ?? 'Yesterday', false),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateQuickPick(String label, bool isPrimary) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isPrimary ? AppColors.primaryContainer.withOpacity(0.1) : AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: AppTheme.labelSm.copyWith(
          color: isPrimary ? AppColors.primary : AppColors.onSurfaceVariant,
          fontWeight: isPrimary ? FontWeight.w700 : FontWeight.w600,
        ),
      ),
    );
  }
}
