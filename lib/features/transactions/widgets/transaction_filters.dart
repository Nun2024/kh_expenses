import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class TransactionFilters extends StatelessWidget {
  final String selectedTime;
  final ValueChanged<String> onTimeChanged;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final String searchQuery;
  final ValueChanged<String> onSearchChanged;
  final double filteredTotalUsd;
  final double filteredTotalKhr;
  final int filteredCount;
  final bool isKhrFirst;

  const TransactionFilters({
    super.key,
    required this.selectedTime,
    required this.onTimeChanged,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.searchQuery,
    required this.onSearchChanged,
    required this.filteredTotalUsd,
    required this.filteredTotalKhr,
    required this.filteredCount,
    required this.isKhrFirst,
  });

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
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.cancel, color: AppColors.outline, size: 18),
                      onPressed: () => onSearchChanged(''),
                    )
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 14),
            ),
            style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface),
            onChanged: onSearchChanged,
          ),
        ),
        const SizedBox(height: 12),
        
        // Time Period Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              _buildTimeChip('This Month'),
              const SizedBox(width: 6),
              _buildTimeChip('Today'),
              const SizedBox(width: 6),
              _buildTimeChip('This Week'),
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
              _buildCategoryChip('All', null),
              const SizedBox(width: 8),
              _buildCategoryChip('Food', '🍜'),
              const SizedBox(width: 8),
              _buildCategoryChip('Transport', '🚕'),
              const SizedBox(width: 8),
              _buildCategoryChip('Shopping', '🛍'),
              const SizedBox(width: 8),
              _buildCategoryChip('Utilities', '💡'),
              const SizedBox(width: 8),
              _buildCategoryChip('Phone & Internet', '📱'),
              const SizedBox(width: 8),
              _buildCategoryChip('Housing', '🏠'),
              const SizedBox(width: 8),
              _buildCategoryChip('Education', '🎓'),
              const SizedBox(width: 8),
              _buildCategoryChip('Other', '📦'),
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
                        isKhrFirst 
                          ? '៛${filteredTotalKhr.round().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}'
                          : '\$${filteredTotalUsd.toStringAsFixed(2)}',
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
                    isKhrFirst
                      ? '≈ \$${filteredTotalUsd.toStringAsFixed(2)} USD'
                      : '≈ ៛${filteredTotalKhr.round().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')} KHR',
                    style: AppTheme.bodySm.copyWith(color: AppColors.primaryFixedDim),
                  ),
                  Text(
                    '$filteredCount entries',
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

  Widget _buildTimeChip(String label) {
    final isSelected = selectedTime == label;
    return GestureDetector(
      onTap: () => onTimeChanged(label),
      child: Container(
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
      ),
    );
  }

  Widget _buildTimeChipCustom() {
    final isSelected = selectedTime == 'Custom';
    return GestureDetector(
      onTap: () => onTimeChanged('Custom'),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.3),
          ),
        ),
        child: Row(
          children: [
            Text('Custom', style: AppTheme.labelMd.copyWith(
              color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
            )),
            const SizedBox(width: 4),
            Icon(Icons.calendar_today, size: 14, color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, String? emoji) {
    final isSelected = selectedCategory == label;
    return GestureDetector(
      onTap: () => onCategoryChanged(label),
      child: Container(
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
      ),
    );
  }
}
