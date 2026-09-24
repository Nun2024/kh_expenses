import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import 'dart:math';
import 'package:kh_expense/l10n/app_localizations.dart';

class CategoryBreakdownChart extends StatelessWidget {
  final String activePeriod;
  final bool isKhrFirst;
  const CategoryBreakdownChart({super.key, this.activePeriod = 'Month', this.isKhrFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)?.categoryBreakdown ?? 'Category Breakdown', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                  Text(AppLocalizations.of(context)?.activeCategoriesMock ?? '4 Active categories recorded', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primaryFixed.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text('100% Tracked', style: AppTheme.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Donut Chart
          Center(
            child: SizedBox(
              width: 180,
              height: 180,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: const Size(180, 180),
                    painter: _DonutChartPainter(),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('🍜', style: TextStyle(fontSize: 24)),
                      Text('37%', style: AppTheme.headlineMd.copyWith(fontWeight: FontWeight.bold, color: AppColors.onSurface)),
                      Text('Top Spend', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Ledger
          _buildCategoryItem('🍜', AppLocalizations.of(context)?.categoryFoodDining ?? 'Food & Dining', '37%', isKhrFirst ? '៛490,200' : '\$120.00', isKhrFirst ? '\$120.00' : '៛490,200', AppColors.primary, 0.37),
          const SizedBox(height: 8),
          _buildCategoryItem('🛍', AppLocalizations.of(context)?.categoryShopping ?? 'Shopping', '25%', isKhrFirst ? '៛334,970' : '\$82.00', isKhrFirst ? '\$82.00' : '៛334,970', AppColors.tertiary, 0.25),
          const SizedBox(height: 8),
          _buildCategoryItem('🚕', AppLocalizations.of(context)?.categoryTransport ?? 'Transport', '20%', isKhrFirst ? '៛265,525' : '\$65.00', isKhrFirst ? '\$65.00' : '៛265,525', AppColors.secondary, 0.20),
          const SizedBox(height: 8),
          _buildCategoryItem('💡', AppLocalizations.of(context)?.categoryUtilities ?? 'Utilities', '18%', isKhrFirst ? '៛245,100' : '\$60.00', isKhrFirst ? '\$60.00' : '៛245,100', AppColors.outline, 0.18),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String emoji, String title, String percentage, String primaryAmount, String secondaryAmount, Color color, double fraction) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(emoji, style: const TextStyle(fontSize: 18)),
                  const SizedBox(width: 8),
                  Text(title, style: AppTheme.bodyMd.copyWith(fontWeight: FontWeight.w600, color: AppColors.onSurface)),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(percentage, style: AppTheme.labelSm.copyWith(color: color, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(primaryAmount, style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                  Text(secondaryAmount, style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainer,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  Container(
                    height: 6,
                    width: constraints.maxWidth * fraction,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2 - 8;
    
    final bgPaint = Paint()
      ..color = AppColors.surfaceContainer
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;
      
    canvas.drawCircle(center, radius, bgPaint);

    double startAngle = -pi / 2;
    
    // Food 37%
    _drawSegment(canvas, center, radius, startAngle, 0.37, AppColors.primary);
    startAngle += 0.37 * 2 * pi;

    // Shopping 25%
    _drawSegment(canvas, center, radius, startAngle, 0.25, AppColors.tertiary);
    startAngle += 0.25 * 2 * pi;

    // Transport 20%
    _drawSegment(canvas, center, radius, startAngle, 0.20, AppColors.secondary);
    startAngle += 0.20 * 2 * pi;

    // Utilities 18%
    _drawSegment(canvas, center, radius, startAngle, 0.18, AppColors.outline);
  }

  void _drawSegment(Canvas canvas, Offset center, double radius, double startAngle, double percentage, Color color) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14
      ..strokeCap = StrokeCap.round;
      
    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, startAngle, percentage * 2 * pi - 0.1, false, paint); // -0.1 to leave a small gap between segments
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
