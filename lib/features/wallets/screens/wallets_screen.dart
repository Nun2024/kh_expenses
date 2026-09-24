import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../dashboard/screens/dashboard_screen.dart';
import '../../statistics/screens/statistics_screen.dart';
import '../../settings/screens/settings_screen.dart';
import '../../expenses/screens/add_expense_screen.dart';
import '../widgets/nbc_rate_banner.dart';
import '../widgets/net_worth_hero_card.dart';
import '../widgets/info_tooltip_banner.dart';
import '../widgets/wallet_list_item.dart';
import '../widgets/wallet_activity_sheet.dart';
import 'package:kh_expense/l10n/app_localizations.dart';

class WalletsScreen extends StatelessWidget {
  const WalletsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.surface.withOpacity(0.95),
        elevation: 0,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
              ),
              child: const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(
                  'assets/profiles/profiles.webp',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context)?.navWallets ?? 'Wallets',
                  style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface),
                ),
                Text(
                  AppLocalizations.of(context)?.nbcRateMock ?? 'NBC: \$1 = ៛4,085',
                  style: AppTheme.labelSm.copyWith(color: AppColors.outline),
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
              color: AppColors.surfaceContainerLowest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.outlineVariant.withOpacity(0.4)),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(color: AppColors.secondary, shape: BoxShape.circle),
                ),
                const SizedBox(width: 6),
                Text(AppLocalizations.of(context)?.usdAndKhr ?? 'USD \$ / ៛', style: AppTheme.labelSm.copyWith(color: AppColors.primary)),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text('•', style: TextStyle(color: AppColors.outlineVariant, fontSize: 10)),
                ),
                Text('៛4,085', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const NbcRateBanner(),
          const SizedBox(height: 16),
          const NetWorthHeroCard(),
          const SizedBox(height: 16),
          InfoTooltipBanner(
            message: AppLocalizations.of(context)?.transferInfoMock ?? 'Transfer between wallets keeps your accounts balanced without inflating reports.',
            boldText: AppLocalizations.of(context)?.abaToCashMock ?? 'ABA → Cash \$100',
          ),
          const SizedBox(height: 24),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)?.accountsAndWallets ?? 'Accounts & Wallets', style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                  Text(AppLocalizations.of(context)?.primaryBankingSub ?? 'Primary banking & local cash reserves', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
              Row(
                children: [
                  Text(AppLocalizations.of(context)?.manageBtn ?? 'Manage', style: AppTheme.labelMd.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  const Icon(Icons.tune, size: 16, color: AppColors.primary),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          WalletListItem(
            name: AppLocalizations.of(context)?.bankAba ?? 'ABA Bank',
            subtitle: AppLocalizations.of(context)?.savingsAccountSub ?? '**** 4821 • Savings Account',
            tagText: AppLocalizations.of(context)?.tagPrimary ?? 'Primary',
            tagColor: AppColors.primary,
            tagBgColor: const Color(0xFF00685F).withOpacity(0.1),
            initials: 'ABA',
            imagePath: 'assets/bank_logo/aba.png',
            smallText: 'BANK',
            avatarColor: const Color(0xFF003755),
            avatarTextColor: Colors.white,
            usdBalance: '\$850.00',
            khrBalance: '៛3,472,250',
            transactionCount: AppLocalizations.of(context)?.transactionsMonthMock ?? '24 transactions this month',
            isSelected: true,
            isKhqr: true,
          ),
          
          const WalletActivitySheet(),
          const SizedBox(height: 12),
          
          WalletListItem(
            name: AppLocalizations.of(context)?.bankAcleda ?? 'ACLEDA Bank',
            subtitle: AppLocalizations.of(context)?.bankAccountSub ?? '**** 2190 • Bank Account',
            tagText: AppLocalizations.of(context)?.tagToanChet ?? 'ToanChet',
            icon: Icons.shield,
            initials: 'ACLEDA',
            imagePath: 'assets/bank_logo/acleda.png',
            avatarColor: const Color(0xFF004785),
            avatarTextColor: Colors.amber,
            usdBalance: '\$430.00',
            khrBalance: '៛1,756,550',
            transactionCount: AppLocalizations.of(context)?.transactions8Mock ?? '8 transactions',
          ),
          
          WalletListItem(
            name: AppLocalizations.of(context)?.bankWing ?? 'Wing Bank / E-Wallet',
            subtitle: AppLocalizations.of(context)?.mobileWalletSub ?? '**** 9012 • Mobile Wallet',
            tagText: '',
            tagBgColor: Colors.transparent,
            icon: Icons.phone_android,
            initials: 'WING',
            imagePath: 'assets/bank_logo/wing.png',
            avatarColor: const Color(0xFF71B02F),
            avatarTextColor: Colors.white,
            usdBalance: '\$250.00',
            khrBalance: '៛1,021,250',
            transactionCount: AppLocalizations.of(context)?.transactions6Mock ?? '6 transactions',
          ),
          
          WalletListItem(
            name: AppLocalizations.of(context)?.cashWallet ?? 'Cash Wallet',
            subtitle: AppLocalizations.of(context)?.cashWalletSub ?? 'USD & Cambodian Riel in Hand',
            tagText: AppLocalizations.of(context)?.tagPhysicalCash ?? 'Physical Cash',
            tagColor: AppColors.tertiary,
            tagBgColor: const Color(0xFFFFDCC3).withOpacity(0.6),
            icon: Icons.payments,
            avatarColor: AppColors.tertiary,
            avatarTextColor: AppColors.onTertiary,
            usdBalance: '\$120.00',
            khrBalance: '៛490,200',
            transactionCount: AppLocalizations.of(context)?.transactions12Mock ?? '12 entries logged',
          ),
          
          WalletListItem(
            name: AppLocalizations.of(context)?.emergencyReserve ?? 'Emergency Reserve',
            subtitle: AppLocalizations.of(context)?.emergencyReserveSub ?? 'Savings • Fixed Deposit',
            tagText: AppLocalizations.of(context)?.tagLockedVault ?? 'Locked Vault',
            icon: Icons.lock,
            avatarColor: AppColors.surfaceContainerHigh,
            avatarTextColor: AppColors.primary,
            usdBalance: '\$200.00',
            khrBalance: '៛817,000',
            transactionCount: AppLocalizations.of(context)?.untouchedMonthMock ?? 'Untouched this month',
          ),
          
          const SizedBox(height: 80),
        ],
      ),
      ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddExpenseScreen()),
          );
        },
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        elevation: 4,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomAppBar(
      height: 75,
      padding: EdgeInsets.zero,
      color: AppColors.surfaceContainerLowest.withOpacity(0.9),
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.dashboard, AppLocalizations.of(context)?.navHome ?? 'Home', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
          }),
          _buildNavItem(context, Icons.query_stats, AppLocalizations.of(context)?.navAnalytics ?? 'Analytics', false, () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const StatisticsScreen()));
          }),
          const SizedBox(width: 48), // Space for FAB
          _buildNavItem(context, Icons.account_balance_wallet, AppLocalizations.of(context)?.navWallets ?? 'Wallets', true, () {}),
          _buildNavItem(context, Icons.settings, AppLocalizations.of(context)?.navSettings ?? 'Settings', false, () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SettingsScreen()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, bool isActive, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isActive ? AppColors.primary : AppColors.onSurfaceVariant),
            const SizedBox(height: 2),
            Text(
              label,
              style: AppTheme.labelSm.copyWith(
                color: isActive ? AppColors.primary : AppColors.onSurfaceVariant,
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: 6,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
