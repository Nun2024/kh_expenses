import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class TransactionFilters extends StatelessWidget {
  const TransactionFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search Bar
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 4,
              ),
            ],
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search transactions, notes, vendors...',
              hintStyle: AppTheme.bodyMd.copyWith(color: AppColors.outline),
              prefixIcon: const Icon(Icons.search, color: AppColors.onSurfaceVariant, size: 20),
              suffixIcon: IconButton(
                icon: const Icon(Icons.cancel, color: AppColors.outline, size: 18),
                onPressed: () {},
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
            style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface),
          ),
        ),
        const SizedBox(height: 12),
        
        // Time Period Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              _buildTimeChip('This Month', true),
              const SizedBox(width: 6),
              _buildTimeChip('Today', false),
              const SizedBox(width: 6),
              _buildTimeChip('This Week', false),
              const SizedBox(width: 6),
              _buildTimeChipCustom(),
            ],
          ),
        ),
        const SizedBox(height: 12),
        
        // Category Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              _buildCategoryChip('All', null, true),
              const SizedBox(width: 8),
              _buildCategoryChip('Food', '🍜', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Transport', '🚕', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Shopping', '🛍', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Utilities', '💡', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Phone & Internet', '📱', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Housing', '🏠', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Education', '🎓', false),
              const SizedBox(width: 8),
              _buildCategoryChip('Other', '📦', false),
            ],
          ),
        ),
        const SizedBox(height: 16),
        
        // Summary Banner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primaryContainer, AppColors.primary],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.12),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.insights, color: AppColors.primaryFixed, size: 20),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FILTERED VIEW TOTAL',
                        style: AppTheme.labelSm.copyWith(color: AppColors.primaryFixed),
                      ),
                      Text(
                        '\$327.50',
                        style: AppTheme.currencyPrimary.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '≈ ៛1,338,000 KHR',
                    style: AppTheme.bodySm.copyWith(color: AppColors.primaryFixedDim),
                  ),
                  Text(
                    '34 entries',
                    style: AppTheme.labelSm.copyWith(color: Colors.white.withOpacity(0.8), fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: AppTheme.labelMd.copyWith(
          color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
        ),
      ),
    );
  }

  Widget _buildTimeChipCustom() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Text('Custom', style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
          const SizedBox(width: 4),
          const Icon(Icons.calendar_today, size: 14, color: AppColors.onSurfaceVariant),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, String? emoji, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.secondary : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.secondary : AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Row(
        children: [
          if (emoji != null) ...[
            Text(emoji, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: AppTheme.labelMd.copyWith(
              color: isSelected ? AppColors.onSecondary : AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
