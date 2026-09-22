import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class PreferencesSection extends StatelessWidget {
  const PreferencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('PREFERENCES', style: AppTheme.labelMd.copyWith(color: AppColors.outline, fontWeight: FontWeight.bold)),
              Text('System Core', style: AppTheme.labelSm.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLowest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 3,
              ),
            ],
          ),
          child: Column(
            children: [
              _buildPreferenceItem(
                icon: Icons.language,
                title: 'Language',
                subtitle: 'Interface display and numerals',
                trailing: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text.rich(
                        TextSpan(
                          text: 'English ',
                          style: AppTheme.labelMd.copyWith(color: AppColors.onSurface),
                          children: [
                            TextSpan(
                              text: '/ ខ្មែរ',
                              style: TextStyle(color: AppColors.outline, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.chevron_right, color: AppColors.outline, size: 20),
                  ],
                ),
              ),
              Divider(height: 1, color: AppColors.outlineVariant.withOpacity(0.2)),
              _buildPreferenceItem(
                icon: Icons.currency_exchange,
                title: 'Default Currency',
                subtitleRich: TextSpan(
                  text: 'NBC Live Rate: ',
                  style: AppTheme.bodySm.copyWith(color: AppColors.outline),
                  children: [
                    TextSpan(
                      text: '៛4,085 / \$1',
                      style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                trailing: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('USD (\$)', style: AppTheme.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                        Text('Primary', style: AppTheme.labelSm.copyWith(color: AppColors.tertiary)),
                      ],
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.chevron_right, color: AppColors.outline, size: 20),
                  ],
                ),
              ),
              Divider(height: 1, color: AppColors.outlineVariant.withOpacity(0.2)),
              _buildPreferenceItem(
                icon: Icons.palette,
                title: 'Appearance',
                subtitle: 'Display theme & contrast',
                trailing: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text('System', style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.chevron_right, color: AppColors.outline, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem({
    required IconData icon,
    required String title,
    String? subtitle,
    TextSpan? subtitleRich,
    required Widget trailing,
  }) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: AppColors.primary, size: 20),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface)),
                    if (subtitle != null)
                      Text(subtitle, style: AppTheme.bodySm.copyWith(color: AppColors.outline)),
                    if (subtitleRich != null)
                      Text.rich(subtitleRich),
                  ],
                ),
              ],
            ),
            trailing,
          ],
        ),
      ),
    );
  }
}
