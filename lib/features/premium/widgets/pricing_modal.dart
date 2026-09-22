import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';

class PricingModal extends StatefulWidget {
  const PricingModal({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PricingModal(),
    );
  }

  @override
  State<PricingModal> createState() => _PricingModalState();
}

class _PricingModalState extends State<PricingModal> {
  String _selectedPlan = 'annual'; // 'annual', 'monthly', 'free'

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // Header & Close Button
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.bolt, size: 16, color: AppColors.primary),
                      const SizedBox(width: 4),
                      Text('KH Expense Pro', style: AppTheme.labelMd.copyWith(color: AppColors.onSecondaryContainer)),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.surfaceContainer,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close, size: 20, color: AppColors.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Unlock Unlimited Freedom',
                    style: AppTheme.headlineLg.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Smart financial insights, auto-receipt scanning, unlimited custom categories, and encrypted cloud backup.',
                    style: AppTheme.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 16),
                  
                  // Live Rate Ticker
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.currency_exchange, size: 18, color: AppColors.primary),
                            const SizedBox(width: 8),
                            Text('Live NBC Reference Rate:', style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                        Text('\$1.00 = ៛4,085 KHR', style: AppTheme.currencySecondary.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Billing Toggle
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainer,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildToggleOption('monthly', 'Billed Monthly'),
                          _buildToggleOption('annual', 'Annually', badge: 'Save 35%'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Plans
                  _buildPlanCard(
                    id: 'annual',
                    title: 'KH Pro Annual',
                    subtitle: 'Full access • 7-day free trial',
                    priceUsd: '\$19.99',
                    period: '/ year',
                    priceKhr: '≈ ៛81,600 KHR',
                    priceDesc: '(\$1.66 / mo)',
                    badge: 'BEST VALUE • SAVE 35%',
                  ),
                  const SizedBox(height: 12),
                  _buildPlanCard(
                    id: 'monthly',
                    title: 'KH Pro Monthly',
                    subtitle: 'Flexible monthly billing',
                    priceUsd: '\$2.49',
                    period: '/ mo',
                    priceKhr: '≈ ៛10,170 KHR',
                  ),
                  const SizedBox(height: 12),
                  _buildFreePlanCard(),
                  
                  const SizedBox(height: 24),
                  
                  // Feature Checklist
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.outlineVariant.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('EVERYTHING INCLUDED IN PRO:', style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 16),
                        _buildFeatureRow('Unlimited KHQR & Receipt OCR Scanning', 'Instant auto-logging from ABA, ACLEDA, and Bakong transaction slips'),
                        _buildFeatureRow('Private Encrypted Cloud Sync', 'Seamless multi-device backup keeping your financial records safe offline & online'),
                        _buildFeatureRow('Advanced Tax & Expense Export', 'Generate Cambodia tax-ready PDF reports and raw CSV spreadsheets'),
                        _buildFeatureRow('Unlimited Custom Categories & Multi-wallets', 'Manage dual USD/KHR cash drawers, bank accounts, and business vaults'),
                        _buildFeatureRow('Custom Live NBC & Market Exchange Rates', 'Override rates for real local market cash conversions'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),
                  Center(
                    child: Column(
                      children: [
                        Text('LOCAL CAMBODIAN INSTANT PAYMENT METHODS', style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            _buildPaymentBadge(Icons.qr_code_2, 'Bakong KHQR', AppColors.error),
                            _buildPaymentBadge(Icons.account_balance, 'ABA PAY', AppColors.primary),
                            _buildPaymentBadge(Icons.payments, 'Wing Bank', AppColors.tertiaryContainer),
                            _buildPaymentBadge(Icons.credit_card, 'Visa / MC', AppColors.onSurfaceVariant),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Sticky Bottom CTA
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceContainerLowest.withOpacity(0.95),
              border: Border(top: BorderSide(color: AppColors.outlineVariant.withOpacity(0.2))),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Action here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.onPrimary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      elevation: 4,
                    ),
                    child: _buildCtaContent(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildTrustBadge(Icons.verified_user, '7-day free trial'),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('•', style: TextStyle(color: AppColors.outlineVariant))),
                    _buildTrustBadge(Icons.cancel, 'Cancel anytime with 1 tap'),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text('•', style: TextStyle(color: AppColors.outlineVariant))),
                    _buildTrustBadge(Icons.lock, 'Bakong secure'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleOption(String id, String label, {String? badge}) {
    final isSelected = _selectedPlan == id;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPlan = id;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: isSelected
            ? BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 2),
                ],
              )
            : const BoxDecoration(),
        child: Row(
          children: [
            Text(
              label,
              style: AppTheme.labelMd.copyWith(
                color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            if (badge != null) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(badge, style: AppTheme.labelSm.copyWith(color: AppColors.onSecondaryFixedVariant)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String id,
    required String title,
    required String subtitle,
    required String priceUsd,
    required String period,
    required String priceKhr,
    String? priceDesc,
    String? badge,
  }) {
    final isSelected = _selectedPlan == id;
    
    return GestureDetector(
      onTap: () => setState(() => _selectedPlan = id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer.withOpacity(0.08) : AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.5),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (badge != null)
              Positioned(
                top: -16,
                right: -16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), topRight: Radius.circular(14)),
                  ),
                  child: Text(badge, style: AppTheme.labelSm.copyWith(color: AppColors.onPrimary, letterSpacing: 1)),
                ),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(title, style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                            if (isSelected) ...[
                              const SizedBox(width: 8),
                              Container(width: 8, height: 8, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                            ],
                          ],
                        ),
                        Text(subtitle, style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                    if (!isSelected && badge == null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(priceUsd, style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              Text(period, style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
                            ],
                          ),
                          Text(priceKhr, style: AppTheme.currencySecondary.copyWith(color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                  ],
                ),
                if (isSelected || badge != null) ...[
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(priceUsd, style: AppTheme.headlineLg.copyWith(color: AppColors.primary, fontWeight: FontWeight.bold)),
                              const SizedBox(width: 4),
                              Text(period, style: AppTheme.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
                            ],
                          ),
                          Row(
                            children: [
                              Text(priceKhr, style: AppTheme.currencySecondary.copyWith(color: AppColors.secondary, fontWeight: FontWeight.w600)),
                              if (priceDesc != null) ...[
                                const SizedBox(width: 4),
                                Text(priceDesc, style: AppTheme.currencySecondary.copyWith(color: AppColors.onSurfaceVariant)),
                              ]
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerLowest,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: Center(
                          child: Container(width: 12, height: 12, decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFreePlanCard() {
    final isSelected = _selectedPlan == 'free';
    return GestureDetector(
      onTap: () => setState(() => _selectedPlan = 'free'),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLow.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant.withOpacity(0.3),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Starter Free', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.w500)),
                Text('Basic offline logs (up to 40 txns/mo)', style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
            Text('\$0 / free', style: AppTheme.headlineSm.copyWith(color: AppColors.onSurfaceVariant, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.secondaryContainer,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, size: 14, color: AppColors.onSecondaryContainer),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTheme.bodyMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
                Text(desc, style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentBadge(IconData icon, String text, Color iconColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outlineVariant.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: iconColor),
          const SizedBox(width: 6),
          Text(text, style: AppTheme.labelMd.copyWith(color: AppColors.onSurface, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildTrustBadge(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: AppColors.secondary),
        const SizedBox(width: 4),
        Text(text, style: AppTheme.labelSm.copyWith(color: AppColors.onSurfaceVariant)),
      ],
    );
  }
  
  Widget _buildCtaContent() {
    if (_selectedPlan == 'annual') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.qr_code_scanner, size: 20),
          const SizedBox(width: 8),
          const Text('Pay with Bakong KHQR • \$19.99 / yr'),
        ],
      );
    } else if (_selectedPlan == 'monthly') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.qr_code_scanner, size: 20),
          const SizedBox(width: 8),
          const Text('Pay with Bakong KHQR • \$2.49 / mo'),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.arrow_forward, size: 20),
          const SizedBox(width: 8),
          const Text('Continue with Starter (Free)'),
        ],
      );
    }
  }
}
