import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

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
                Text('Category', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                const SizedBox(width: 6),
                Text('• Tap to select', style: AppTheme.bodySm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500)),
              ],
            ),
            Text('8 presets', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
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
            _buildCategoryItem('Food', '🍜', activeCategory == 'Food'),
            _buildCategoryItem('Transport', '🚕', activeCategory == 'Transport'),
            _buildCategoryItem('Housing', '🏠', activeCategory == 'Housing'),
            _buildCategoryItem('Shopping', '🛍', activeCategory == 'Shopping'),
            _buildCategoryItem('Utilities', '💡', activeCategory == 'Utilities'),
            _buildCategoryItem('Phone & Net', '📱', activeCategory == 'Phone & Net'),
            _buildCategoryItem('Education', '🎓', activeCategory == 'Education'),
            _buildCategoryItem('Other', '📦', activeCategory == 'Other'),
          ],
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String name, String emoji, bool isSelected) {
    return GestureDetector(
      onTap: () => onCategorySelected(name),
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
