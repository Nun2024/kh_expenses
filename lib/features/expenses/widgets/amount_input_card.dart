import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class AmountInputCard extends StatelessWidget {
  final String currentCurrency;
  final String amountStr;
  final double fxRate;
  final Function(String) onCurrencyChanged;
  final Function(double) onQuickAdd;

  const AmountInputCard({
    super.key,
    required this.currentCurrency,
    required this.amountStr,
    required this.fxRate,
    required this.onCurrencyChanged,
    required this.onQuickAdd,
  });

  @override
  Widget build(BuildContext context) {
    final double num = double.tryParse(amountStr) ?? 0;
    String displayStr;
    String prefix;
    String convertedStr;

    if (currentCurrency == 'USD') {
      prefix = '\$';
      displayStr = amountStr;
      final rielVal = (num * fxRate).round();
      convertedStr = '≈ ៛ ${rielVal.toString().replaceAllMapped(RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'), (Match m) => '${m[1]},')} KHR';
    } else {
      prefix = '៛';
      displayStr = num.round().toString().replaceAllMapped(RegExp(r'(\\d{1,3})(?=(\\d{3})+(?!\\d))'), (Match m) => '${m[1]},');
      final usdVal = (num / fxRate).toStringAsFixed(2);
      convertedStr = '≈ \$ $usdVal USD';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    Container(width: 6, height: 6, decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle)),
                    const SizedBox(width: 4),
                    Text(AppLocalizations.of(context)?.nbcRateMock ?? 'NBC Rate: \$1 = ៛4,085', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    _buildCurrencyToggle(AppLocalizations.of(context)?.currencyUsd ?? 'USD \$', currentCurrency == 'USD', () => onCurrencyChanged('USD')),
                    _buildCurrencyToggle(AppLocalizations.of(context)?.currencyKhr ?? 'KHR ៛', currentCurrency == 'KHR', () => onCurrencyChanged('KHR')),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(prefix, style: AppTheme.displayHero.copyWith(color: AppColors.primary, fontSize: 30)),
              const SizedBox(width: 4),
              Text(displayStr, style: AppTheme.displayHero.copyWith(color: AppColors.onSurface, fontSize: 44)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.sync_alt, color: AppColors.primary, size: 16),
              const SizedBox(width: 6),
              Text(convertedStr, style: AppTheme.currencySecondary.copyWith(color: AppColors.onSurfaceVariant, letterSpacing: 0.5)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2))),
            ),
            child: Row(
              children: [
                Expanded(child: _buildQuickAddButton('+\$1.00', () => onQuickAdd(1))),
                const SizedBox(width: 8),
                Expanded(child: _buildQuickAddButton('+\$2.00', () => onQuickAdd(2))),
                const SizedBox(width: 8),
                Expanded(child: _buildQuickAddButton('+\$5.00', () => onQuickAdd(5))),
                const SizedBox(width: 8),
                Expanded(child: _buildQuickAddButton('+\$10.00', () => onQuickAdd(10))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyToggle(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2),
                ],
              )
            : null,
        child: Text(
          label,
          style: AppTheme.labelSm.copyWith(
            color: isSelected ? AppColors.onPrimary : AppColors.onSurfaceVariant,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildQuickAddButton(String label, VoidCallback onTap) {
    return Material(
      color: AppColors.surfaceContainerLow,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Center(
            child: Text(
              label,
              style: AppTheme.bodySm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
