import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class SettingsHeader extends StatelessWidget implements PreferredSizeWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: AppColors.surface.withOpacity(0.95),
      elevation: 0,
      title: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primary.withOpacity(0.2)),
            ),
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.secondaryContainer,
              backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuB5B_pX4g1UF5oLHHEE63-sMmkiA5qLef1lkI8yMQ9cIYVWw95vyStJoQ_tkz6vK4TxzUPnQ0yVQtVr-lx3UchyyG1xCCVKg_W7V2tBTsdX7Dy8iOuTt90lma_uof0eXT70oHbbvsh_TbpI4e9ryQbG2PBrdU1Hw5DuCemtv3TLQdB_7EiyCX4LwqQ7Q3e28I9Y-A1Jv-G07J04qHp551_K07wHL7vODTw57NDJbNxN788ZK6qbiDmA',
              ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Settings',
                style: AppTheme.headlineMd.copyWith(color: AppColors.primary),
              ),
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'NBC Rate Synced Today',
                    style: AppTheme.labelSm.copyWith(color: AppColors.outline),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.surfaceContainer,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              Text('USD \$', style: AppTheme.labelMd.copyWith(color: AppColors.primary)),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text('/', style: TextStyle(color: AppColors.outline, fontSize: 12)),
              ),
              Text('៛', style: AppTheme.labelMd.copyWith(color: AppColors.tertiary)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
