import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class NumericKeypad extends StatelessWidget {
  final Function(String) onKeyPress;
  final VoidCallback onBackspace;

  const NumericKeypad({
    super.key,
    required this.onKeyPress,
    required this.onBackspace,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest.withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 2.5,
        padding: EdgeInsets.zero,
        children: [
          _buildKey('1'),
          _buildKey('2'),
          _buildKey('3'),
          _buildKey('4'),
          _buildKey('5'),
          _buildKey('6'),
          _buildKey('7'),
          _buildKey('8'),
          _buildKey('9'),
          _buildKey('.'),
          _buildKey('0'),
          _buildBackspaceKey(),
        ],
      ),
    );
  }

  Widget _buildKey(String value) {
    return Material(
      color: AppColors.surfaceContainerLow.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () => onKeyPress(value),
        borderRadius: BorderRadius.circular(12),
        child: Center(
          child: Text(
            value,
            style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceKey() {
    return Material(
      color: AppColors.surfaceContainerLow.withOpacity(0.7),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onBackspace,
        borderRadius: BorderRadius.circular(12),
        child: const Center(
          child: Icon(Icons.backspace, color: AppColors.onSurface, size: 20),
        ),
      ),
    );
  }
}
