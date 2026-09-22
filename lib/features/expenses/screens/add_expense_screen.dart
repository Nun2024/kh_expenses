import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../premium/widgets/pricing_modal.dart';
import '../widgets/amount_input_card.dart';
import '../widgets/category_picker_grid.dart';
import '../widgets/payment_method_list.dart';
import '../widgets/expense_details_card.dart';
import '../widgets/numeric_keypad.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  String _currentCurrency = 'USD';
  String _currentAmountStr = '5.50';
  String _activeCategory = 'Food';
  String _activePayment = 'Bakong KHQR';
  final double _fxRate = 4085;

  void _onCurrencyChanged(String currency) {
    if (_currentCurrency == currency) return;
    setState(() {
      _currentCurrency = currency;
      if (currency == 'USD') {
        _currentAmountStr = '5.50';
      } else {
        _currentAmountStr = '22000';
      }
    });
  }

  void _onKeyPress(String char) {
    setState(() {
      if ((_currentAmountStr == '0' || _currentAmountStr == '5.50') && char != '.') {
        _currentAmountStr = char;
      } else {
        if (char == '.' && _currentAmountStr.contains('.')) return;
        _currentAmountStr += char;
      }
    });
  }

  void _onBackspace() {
    setState(() {
      if (_currentAmountStr.length > 1) {
        _currentAmountStr = _currentAmountStr.substring(0, _currentAmountStr.length - 1);
      } else {
        _currentAmountStr = '0';
      }
    });
  }

  void _onQuickAdd(double val) {
    setState(() {
      double num = double.tryParse(_currentAmountStr) ?? 0;
      if (_currentCurrency == 'USD') {
        _currentAmountStr = (num + val).toStringAsFixed(2);
      } else {
        _currentAmountStr = (num + (val * _fxRate)).round().toString();
      }
    });
  }

  void _onClear() {
    setState(() {
      _currentAmountStr = '0';
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      _activeCategory = category;
    });
  }

  void _onPaymentSelected(String payment) {
    setState(() {
      _activePayment = payment;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double num = double.tryParse(_currentAmountStr) ?? 0;
    String ctaLabel;
    if (_currentCurrency == 'USD') {
      ctaLabel = 'Save Expense • \$$_currentAmountStr';
    } else {
      ctaLabel = 'Save Expense • ៛${num.round().toString().replaceAllMapped(RegExp(r"(\\d{1,3})(?=(\\d{3})+(?!\\d))"), (Match m) => "${m[1]},")}';
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface.withOpacity(0.95),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.onSurface),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Add Expense', style: AppTheme.headlineMd.copyWith(color: AppColors.onSurface)),
        actions: [
          TextButton(
            onPressed: _onClear,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.error,
              padding: const EdgeInsets.symmetric(horizontal: 12),
            ),
            child: Text('Clear', style: AppTheme.labelMd),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: AppColors.onSurfaceVariant, size: 20),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    AmountInputCard(
                      currentCurrency: _currentCurrency,
                      amountStr: _currentAmountStr,
                      fxRate: _fxRate,
                      onCurrencyChanged: _onCurrencyChanged,
                      onQuickAdd: _onQuickAdd,
                    ),
                    const SizedBox(height: 16),
                    CategoryPickerGrid(
                      activeCategory: _activeCategory,
                      onCategorySelected: _onCategorySelected,
                    ),
                    const SizedBox(height: 16),
                    PaymentMethodList(
                      activePayment: _activePayment,
                      onPaymentSelected: _onPaymentSelected,
                    ),
                    const SizedBox(height: 16),
                    const ExpenseDetailsCard(),
                    const SizedBox(height: 16),
                    NumericKeypad(
                      onKeyPress: _onKeyPress,
                      onBackspace: _onBackspace,
                    ),
                    const SizedBox(height: 80), // padding for bottom action area
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.surfaceContainerLowest.withOpacity(0.95),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                PricingModal.show(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, size: 22),
                  const SizedBox(width: 8),
                  Text(ctaLabel, style: AppTheme.headlineSm),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.offline_pin, size: 14, color: AppColors.secondary),
                const SizedBox(width: 6),
                Text(
                  'Offline-first • Instant sync to Bakong & Local Wallet',
                  style: AppTheme.bodySm.copyWith(color: AppColors.onSurfaceVariant, fontSize: 11),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
