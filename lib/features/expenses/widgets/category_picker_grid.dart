import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class CategoryPickerGrid extends StatelessWidget {
  final String activeCategory;
  final Function(String) onCategorySelected;

  const CategoryPickerGrid({
    super.key,
    required this.activeCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(AppLocalizations.of(context)?.category ?? 'Category', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                const SizedBox(width: 6),
                Text(AppLocalizations.of(context)?.tapToSelect ?? '• Tap to select', style: AppTheme.bodySm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500)),
              ],
            ),
            Text(AppLocalizations.of(context)?.presetsCount ?? '8 presets', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
          ],
        ),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 0.85,
          padding: EdgeInsets.zero,
          children: [
            _buildCategoryItem(AppLocalizations.of(context)?.categoryFood ?? 'Food', '🍜', activeCategory == 'Food', () => onCategorySelected('Food')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryTransportShort ?? 'Transport', '🚕', activeCategory == 'Transport', () => onCategorySelected('Transport')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryHousing ?? 'Housing', '🏠', activeCategory == 'Housing', () => onCategorySelected('Housing')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryShoppingShort ?? 'Shopping', '🛍', activeCategory == 'Shopping', () => onCategorySelected('Shopping')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryUtilitiesShort ?? 'Utilities', '💡', activeCategory == 'Utilities', () => onCategorySelected('Utilities')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryPhoneNet ?? 'Phone & Net', '📱', activeCategory == 'Phone & Net', () => onCategorySelected('Phone & Net')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryEducation ?? 'Education', '🎓', activeCategory == 'Education', () => onCategorySelected('Education')),
            _buildCategoryItem(AppLocalizations.of(context)?.categoryOther ?? 'Other', '📦', activeCategory == 'Other', () => onCategorySelected('Other')),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String name, String emoji, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.2), blurRadius: 0, spreadRadius: 2)]
              : null,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primaryContainer.withOpacity(0.15) : AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: Text(emoji, style: const TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: AppTheme.labelMd.copyWith(
                    color: isSelected ? AppColors.primary : AppColors.onSurface,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            if (isSelected)
              Positioned(
                top: -4,
                right: -4,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.check, color: AppColors.onPrimary, size: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
