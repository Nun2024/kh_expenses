import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class InfoTooltipBanner extends StatelessWidget {
  final String message;
  final String boldText;
  
  const InfoTooltipBanner({
    super.key, 
    required this.message, 
    this.boldText = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh.withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 2),
            child: Icon(Icons.info, size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant, height: 1.5),
                children: [
                  TextSpan(text: message.split(boldText).first),
                  if (boldText.isNotEmpty)
                    TextSpan(
                      text: boldText,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.onSurface),
                    ),
                  if (boldText.isNotEmpty && message.split(boldText).length > 1)
                    TextSpan(text: message.split(boldText).last),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
