lib/
│
├── main.dart
│
├── app/
│   ├── app.dart
│   ├── router/
│   │   └── app_router.dart
│   │
│   └── theme/
│       ├── app_theme.dart
│       ├── app_colors.dart
│       └── app_text_styles.dart
│
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   ├── currency_constants.dart
│   │   └── payment_constants.dart
│   │
│   ├── localization/
│   │   └── locale_provider.dart
│   │
│   └── utils/
│       ├── currency_formatter.dart
│       └── date_formatter.dart
│
├── features/
│   │
│   ├── dashboard/
│   │   ├── screens/
│   │   │   └── dashboard_screen.dart
│   │   └── widgets/
│   │       ├── balance_card.dart
│   │       ├── spending_summary.dart
│   │       └── recent_transactions.dart
│   │
│   ├── wallets/
│   │   ├── models/
│   │   │   └── wallet.dart
│   │   ├── screens/
│   │   │   ├── wallets_screen.dart
│   │   │   ├── wallet_detail_screen.dart
│   │   │   └── add_wallet_screen.dart
│   │   ├── widgets/
│   │   │   └── wallet_card.dart
│   │   └── providers/
│   │       └── wallet_provider.dart
│   │
│   ├── expenses/
│   │   ├── models/
│   │   │   └── expense.dart
│   │   ├── screens/
│   │   │   ├── add_expense_screen.dart
│   │   │   ├── transactions_screen.dart
│   │   │   └── expense_detail_screen.dart
│   │   ├── widgets/
│   │   │   ├── category_selector.dart
│   │   │   └── payment_method_selector.dart
│   │   └── providers/
│   │       └── expense_provider.dart
│   │
│   ├── statistics/
│   │   ├── screens/
│   │   │   └── statistics_screen.dart
│   │   └── widgets/
│   │       ├── category_chart.dart
│   │       └── spending_chart.dart
│   │
│   └── settings/
│       ├── screens/
│       │   └── settings_screen.dart
│       └── widgets/
│           ├── language_selector.dart
│           ├── currency_selector.dart
│           └── theme_selector.dart
│
└── l10n/
    ├── app_en.arb
    └── app_km.arb