import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class NetWorthHeroCard extends StatelessWidget {
  const NetWorthHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryContainer, AppColors.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -24,
            bottom: -24,
            child: Container(
              width: 128,
              height: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Icon(Icons.account_balance, size: 72, color: Colors.white.withOpacity(0.15)),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TOTAL NET WORTH',
                      style: AppTheme.labelMd.copyWith(color: AppColors.onPrimaryContainer.withOpacity(0.9), letterSpacing: 1),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        '5 Active Accounts',
                        style: AppTheme.labelSm.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '\$1,850.00',
                      style: AppTheme.displayHero.copyWith(color: Colors.white, fontSize: 28),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'USD',
                      style: AppTheme.bodyMd.copyWith(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('≈', style: TextStyle(color: Colors.white.withOpacity(0.7))),
                    const SizedBox(width: 6),
                    Text(
                      '៛7,557,250',
                      style: AppTheme.headlineSm.copyWith(color: AppColors.tertiaryFixed),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'KHR',
                      style: AppTheme.bodySm.copyWith(color: Colors.white.withOpacity(0.8)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.white.withOpacity(0.15))),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildFlowBadge(
                          icon: Icons.arrow_downward,
                          iconColor: AppColors.secondaryFixed,
                          label: 'Income (Sep)',
                          amount: '+\$1,200.00',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildFlowBadge(
                          icon: Icons.arrow_upward,
                          iconColor: AppColors.errorContainer,
                          label: 'Outflow (Sep)',
                          amount: '-\$327.50',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.add_circle,
                        label: 'Add Money',
                        backgroundColor: Colors.white,
                        textColor: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.swap_horiz,
                        label: 'Transfer',
                        backgroundColor: Colors.white.withOpacity(0.2),
                        textColor: Colors.white,
                        borderColor: Colors.white.withOpacity(0.2),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildQuickAction(
                        icon: Icons.donut_small,
                        label: 'Allocation',
                        backgroundColor: Colors.white.withOpacity(0.1),
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlowBadge({required IconData icon, required Color iconColor, required String label, required String amount}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 14, color: iconColor),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTheme.labelSm.copyWith(color: Colors.white.withOpacity(0.7))),
              Text(amount, style: AppTheme.headlineSm.copyWith(color: Colors.white, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction({required IconData icon, required String label, required Color backgroundColor, required Color textColor, Color? borderColor}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: borderColor != null ? Border.all(color: borderColor) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 4),
          Text(label, style: AppTheme.labelMd.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
