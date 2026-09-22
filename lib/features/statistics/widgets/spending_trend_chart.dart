import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class SpendingTrendChart extends StatelessWidget {
  const SpendingTrendChart({super.key});

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
                  Text('Spending Trajectory', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                  Text('Daily fluctuations', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('PEAK', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                  Text('\$34.50', style: AppTheme.bodySm.copyWith(fontWeight: FontWeight.bold, color: AppColors.error)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Simplified placeholder for chart, using CustomPaint
          SizedBox(
            height: 120,
            width: double.infinity,
            child: Stack(
              children: [
                CustomPaint(
                  size: const Size(double.infinity, 120),
                  painter: _LineChartPainter(),
                ),
                Positioned(
                  top: 0,
                  left: 170, // Roughly position over peak
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.inverseSurface,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text('Sep 21:', style: AppTheme.labelSm.copyWith(color: AppColors.primaryFixed, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4),
                        Text('\$34.50', style: AppTheme.labelSm.copyWith(color: AppColors.inverseOnSurface)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sep 1', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
              Text('Sep 7', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
              Text('Sep 14', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
              Text('Sep 21', style: AppTheme.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
              Text('Sep 30', style: AppTheme.labelSm.copyWith(color: AppColors.outline)),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.insights, size: 18, color: AppColors.primary),
                    const SizedBox(width: 8),
                    Text.rich(
                      TextSpan(
                        text: 'Weekend spending is ',
                        style: AppTheme.bodySm.copyWith(color: AppColors.onSurface),
                        children: [
                          TextSpan(
                            text: '+24% higher',
                            style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('STABLE', style: AppTheme.labelSm.copyWith(color: AppColors.outlineVariant, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.7, size.width * 0.2, size.height * 0.6);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.4, size.width * 0.6, size.height * 0.2); // peak
    path.quadraticBezierTo(size.width * 0.8, size.height * 0.6, size.width, size.height * 0.4);

    final linePaint = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          AppColors.primary.withOpacity(0.3),
          AppColors.primary.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    // Grid lines
    final gridPaint = Paint()
      ..color = AppColors.surfaceVariant
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
      
    canvas.drawLine(Offset(0, size.height * 0.25), Offset(size.width, size.height * 0.25), gridPaint);
    canvas.drawLine(Offset(0, size.height * 0.5), Offset(size.width, size.height * 0.5), gridPaint);
    canvas.drawLine(Offset(0, size.height * 0.75), Offset(size.width, size.height * 0.75), gridPaint);
    
    // Points
    final dotPaint = Paint()..color = AppColors.primary;
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.6), 4, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.4, size.height * 0.45), 4, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.6), 4, dotPaint);
    
    // Peak point
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.2), 6, dotPaint);
    canvas.drawCircle(Offset(size.width * 0.6, size.height * 0.2), 4, Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
