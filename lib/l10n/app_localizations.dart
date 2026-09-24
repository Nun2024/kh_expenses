import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_km.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('km'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'KH Expense'**
  String get appTitle;

  /// No description provided for @smartLedger.
  ///
  /// In en, this message translates to:
  /// **'Smart Ledger'**
  String get smartLedger;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAnalytics.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get navAnalytics;

  /// No description provided for @navWallets.
  ///
  /// In en, this message translates to:
  /// **'Wallets'**
  String get navWallets;

  /// No description provided for @navSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get navSettings;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageEn.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settingsLanguageEn;

  /// No description provided for @settingsLanguageKm.
  ///
  /// In en, this message translates to:
  /// **'Khmer'**
  String get settingsLanguageKm;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening, Xumu 👋'**
  String get goodEvening;

  /// No description provided for @trackSpending.
  ///
  /// In en, this message translates to:
  /// **'Track dual spending in real time'**
  String get trackSpending;

  /// No description provided for @spendingByCategory.
  ///
  /// In en, this message translates to:
  /// **'Spending by Category'**
  String get spendingByCategory;

  /// No description provided for @seeBreakdown.
  ///
  /// In en, this message translates to:
  /// **'See Breakdown'**
  String get seeBreakdown;

  /// No description provided for @categoryFoodDining.
  ///
  /// In en, this message translates to:
  /// **'Food & Dining'**
  String get categoryFoodDining;

  /// No description provided for @categoryShopping.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get categoryShopping;

  /// No description provided for @categoryTransport.
  ///
  /// In en, this message translates to:
  /// **'Transport (PassApp/Grab)'**
  String get categoryTransport;

  /// No description provided for @categoryUtilities.
  ///
  /// In en, this message translates to:
  /// **'Utilities (EDC/Water)'**
  String get categoryUtilities;

  /// No description provided for @todaysSpend.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Spend'**
  String get todaysSpend;

  /// No description provided for @transactionsTodayMock.
  ///
  /// In en, this message translates to:
  /// **'3 transactions today'**
  String get transactionsTodayMock;

  /// No description provided for @monthlyBudget.
  ///
  /// In en, this message translates to:
  /// **'Monthly Budget'**
  String get monthlyBudget;

  /// No description provided for @budgetUsedPercentMock.
  ///
  /// In en, this message translates to:
  /// **'65% used'**
  String get budgetUsedPercentMock;

  /// No description provided for @budgetLeftAmountMock.
  ///
  /// In en, this message translates to:
  /// **'Left: \$172.50'**
  String get budgetLeftAmountMock;

  /// No description provided for @recentTransactions.
  ///
  /// In en, this message translates to:
  /// **'Recent Transactions'**
  String get recentTransactions;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @paymentCash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get paymentCash;

  /// No description provided for @paymentABAPay.
  ///
  /// In en, this message translates to:
  /// **'ABA Pay'**
  String get paymentABAPay;

  /// No description provided for @paymentBakong.
  ///
  /// In en, this message translates to:
  /// **'Bakong KHQR'**
  String get paymentBakong;

  /// No description provided for @paymentWing.
  ///
  /// In en, this message translates to:
  /// **'Wing'**
  String get paymentWing;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @mockTx1Title.
  ///
  /// In en, this message translates to:
  /// **'Khmer Noodle Soup (Nom Banh Chok)'**
  String get mockTx1Title;

  /// No description provided for @mockTx1Time.
  ///
  /// In en, this message translates to:
  /// **'12:45 PM'**
  String get mockTx1Time;

  /// No description provided for @mockTx2Title.
  ///
  /// In en, this message translates to:
  /// **'PassApp Rickshaw'**
  String get mockTx2Title;

  /// No description provided for @mockTx2Time.
  ///
  /// In en, this message translates to:
  /// **'9:15 AM'**
  String get mockTx2Time;

  /// No description provided for @mockTx3Title.
  ///
  /// In en, this message translates to:
  /// **'Brown Coffee / Iced Latte'**
  String get mockTx3Title;

  /// No description provided for @mockTx3Time.
  ///
  /// In en, this message translates to:
  /// **'8:30 AM'**
  String get mockTx3Time;

  /// No description provided for @mockTx4Title.
  ///
  /// In en, this message translates to:
  /// **'Aeon Mart Groceries'**
  String get mockTx4Title;

  /// No description provided for @totalSpendingMonth.
  ///
  /// In en, this message translates to:
  /// **'TOTAL SPENDING (SEPTEMBER 2026)'**
  String get totalSpendingMonth;

  /// No description provided for @usdAndKhr.
  ///
  /// In en, this message translates to:
  /// **'USD & KHR'**
  String get usdAndKhr;

  /// No description provided for @exchangeRateMock.
  ///
  /// In en, this message translates to:
  /// **'Rate: \$1 = ៛4,085'**
  String get exchangeRateMock;

  /// No description provided for @vsLastMonthMock.
  ///
  /// In en, this message translates to:
  /// **'-12% vs last mo'**
  String get vsLastMonthMock;

  /// No description provided for @filterToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get filterToday;

  /// No description provided for @filterThisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get filterThisWeek;

  /// No description provided for @filterThisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get filterThisMonth;

  /// No description provided for @fastLog.
  ///
  /// In en, this message translates to:
  /// **'Fast Log'**
  String get fastLog;

  /// No description provided for @nbcRateSyncedToday.
  ///
  /// In en, this message translates to:
  /// **'NBC Rate Synced Today'**
  String get nbcRateSyncedToday;

  /// No description provided for @spendingInsights.
  ///
  /// In en, this message translates to:
  /// **'Spending Insights'**
  String get spendingInsights;

  /// No description provided for @nbcRateMock.
  ///
  /// In en, this message translates to:
  /// **'NBC: \$1 = ៛4,085'**
  String get nbcRateMock;

  /// No description provided for @saveExpensePrefix.
  ///
  /// In en, this message translates to:
  /// **'Save Expense •'**
  String get saveExpensePrefix;

  /// No description provided for @addExpense.
  ///
  /// In en, this message translates to:
  /// **'Add Expense'**
  String get addExpense;

  /// No description provided for @clearBtn.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clearBtn;

  /// No description provided for @offlineFirstSync.
  ///
  /// In en, this message translates to:
  /// **'Offline-first • Instant sync to Bakong & Local Wallet'**
  String get offlineFirstSync;

  /// No description provided for @currencyUsd.
  ///
  /// In en, this message translates to:
  /// **'USD \$'**
  String get currencyUsd;

  /// No description provided for @currencyKhr.
  ///
  /// In en, this message translates to:
  /// **'KHR ៛'**
  String get currencyKhr;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @tapToSelect.
  ///
  /// In en, this message translates to:
  /// **'• Tap to select'**
  String get tapToSelect;

  /// No description provided for @presetsCount.
  ///
  /// In en, this message translates to:
  /// **'8 presets'**
  String get presetsCount;

  /// No description provided for @categoryFood.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get categoryFood;

  /// No description provided for @categoryTransportShort.
  ///
  /// In en, this message translates to:
  /// **'Transport'**
  String get categoryTransportShort;

  /// No description provided for @categoryHousing.
  ///
  /// In en, this message translates to:
  /// **'Housing'**
  String get categoryHousing;

  /// No description provided for @categoryShoppingShort.
  ///
  /// In en, this message translates to:
  /// **'Shopping'**
  String get categoryShoppingShort;

  /// No description provided for @categoryUtilitiesShort.
  ///
  /// In en, this message translates to:
  /// **'Utilities'**
  String get categoryUtilitiesShort;

  /// No description provided for @categoryPhoneNet.
  ///
  /// In en, this message translates to:
  /// **'Phone & Net'**
  String get categoryPhoneNet;

  /// No description provided for @categoryEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get categoryEducation;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @expenseNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Lunch with friends (optional)'**
  String get expenseNotesHint;

  /// No description provided for @dateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date:'**
  String get dateLabel;

  /// No description provided for @mockDate.
  ///
  /// In en, this message translates to:
  /// **'Today, Sep 21'**
  String get mockDate;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @khqrReady.
  ///
  /// In en, this message translates to:
  /// **'KHQR Ready'**
  String get khqrReady;

  /// No description provided for @paymentCashKhr.
  ///
  /// In en, this message translates to:
  /// **'Cash (US\$ / ៛)'**
  String get paymentCashKhr;

  /// No description provided for @paymentAcleda.
  ///
  /// In en, this message translates to:
  /// **'ACLEDA'**
  String get paymentAcleda;

  /// No description provided for @paymentWingBank.
  ///
  /// In en, this message translates to:
  /// **'Wing Bank'**
  String get paymentWingBank;

  /// No description provided for @paymentBankTransfer.
  ///
  /// In en, this message translates to:
  /// **'Bank Transfer'**
  String get paymentBankTransfer;

  /// No description provided for @paymentOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get paymentOther;

  /// No description provided for @fastLabel.
  ///
  /// In en, this message translates to:
  /// **'FAST'**
  String get fastLabel;

  /// No description provided for @expenseOverview.
  ///
  /// In en, this message translates to:
  /// **'Expense overview & insights'**
  String get expenseOverview;

  /// No description provided for @periodWeek.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get periodWeek;

  /// No description provided for @periodMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get periodMonth;

  /// No description provided for @periodYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get periodYear;

  /// No description provided for @cycle30Days.
  ///
  /// In en, this message translates to:
  /// **'30 Days Cycle'**
  String get cycle30Days;

  /// No description provided for @totalOutflow.
  ///
  /// In en, this message translates to:
  /// **'TOTAL OUTFLOW'**
  String get totalOutflow;

  /// No description provided for @dailyPace.
  ///
  /// In en, this message translates to:
  /// **'Daily Pace'**
  String get dailyPace;

  /// No description provided for @avgDailyPaceMockUsd.
  ///
  /// In en, this message translates to:
  /// **'Avg \$10.90 / day'**
  String get avgDailyPaceMockUsd;

  /// No description provided for @avgDailyPaceMockKhr.
  ///
  /// In en, this message translates to:
  /// **'Avg ៛44.5K / day'**
  String get avgDailyPaceMockKhr;

  /// No description provided for @categoryBreakdown.
  ///
  /// In en, this message translates to:
  /// **'Category Breakdown'**
  String get categoryBreakdown;

  /// No description provided for @activeCategoriesMock.
  ///
  /// In en, this message translates to:
  /// **'4 Active categories recorded'**
  String get activeCategoriesMock;

  /// No description provided for @spendingTrajectory.
  ///
  /// In en, this message translates to:
  /// **'Spending Trajectory'**
  String get spendingTrajectory;

  /// No description provided for @dailyFluctuations.
  ///
  /// In en, this message translates to:
  /// **'Daily fluctuations'**
  String get dailyFluctuations;

  /// No description provided for @peak.
  ///
  /// In en, this message translates to:
  /// **'PEAK'**
  String get peak;

  /// No description provided for @topCategorySpotlight.
  ///
  /// In en, this message translates to:
  /// **'Top Category Spotlight'**
  String get topCategorySpotlight;

  /// No description provided for @recordedTransactionsMock.
  ///
  /// In en, this message translates to:
  /// **'24 recorded transactions'**
  String get recordedTransactionsMock;

  /// No description provided for @budgetHealth.
  ///
  /// In en, this message translates to:
  /// **'Budget Health'**
  String get budgetHealth;

  /// No description provided for @budgetRemainingMock.
  ///
  /// In en, this message translates to:
  /// **'68% of monthly limit remaining'**
  String get budgetRemainingMock;

  /// No description provided for @limitsBtn.
  ///
  /// In en, this message translates to:
  /// **'Limits'**
  String get limitsBtn;

  /// No description provided for @transferInfoMock.
  ///
  /// In en, this message translates to:
  /// **'Transfer between wallets keeps your accounts balanced without inflating reports.'**
  String get transferInfoMock;

  /// No description provided for @abaToCashMock.
  ///
  /// In en, this message translates to:
  /// **'ABA → Cash \$100'**
  String get abaToCashMock;

  /// No description provided for @accountsAndWallets.
  ///
  /// In en, this message translates to:
  /// **'Accounts & Wallets'**
  String get accountsAndWallets;

  /// No description provided for @primaryBankingSub.
  ///
  /// In en, this message translates to:
  /// **'Primary banking & local cash reserves'**
  String get primaryBankingSub;

  /// No description provided for @manageBtn.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manageBtn;

  /// No description provided for @bankAba.
  ///
  /// In en, this message translates to:
  /// **'ABA Bank'**
  String get bankAba;

  /// No description provided for @savingsAccountSub.
  ///
  /// In en, this message translates to:
  /// **'**** 4821 • Savings Account'**
  String get savingsAccountSub;

  /// No description provided for @tagPrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get tagPrimary;

  /// No description provided for @transactionsMonthMock.
  ///
  /// In en, this message translates to:
  /// **'24 transactions this month'**
  String get transactionsMonthMock;

  /// No description provided for @bankAcleda.
  ///
  /// In en, this message translates to:
  /// **'ACLEDA Bank'**
  String get bankAcleda;

  /// No description provided for @bankAccountSub.
  ///
  /// In en, this message translates to:
  /// **'**** 2190 • Bank Account'**
  String get bankAccountSub;

  /// No description provided for @tagToanChet.
  ///
  /// In en, this message translates to:
  /// **'ToanChet'**
  String get tagToanChet;

  /// No description provided for @transactions8Mock.
  ///
  /// In en, this message translates to:
  /// **'8 transactions'**
  String get transactions8Mock;

  /// No description provided for @bankWing.
  ///
  /// In en, this message translates to:
  /// **'Wing Bank / E-Wallet'**
  String get bankWing;

  /// No description provided for @mobileWalletSub.
  ///
  /// In en, this message translates to:
  /// **'**** 9012 • Mobile Wallet'**
  String get mobileWalletSub;

  /// No description provided for @transactions6Mock.
  ///
  /// In en, this message translates to:
  /// **'6 transactions'**
  String get transactions6Mock;

  /// No description provided for @cashWallet.
  ///
  /// In en, this message translates to:
  /// **'Cash Wallet'**
  String get cashWallet;

  /// No description provided for @cashWalletSub.
  ///
  /// In en, this message translates to:
  /// **'USD & Cambodian Riel in Hand'**
  String get cashWalletSub;

  /// No description provided for @tagPhysicalCash.
  ///
  /// In en, this message translates to:
  /// **'Physical Cash'**
  String get tagPhysicalCash;

  /// No description provided for @transactions12Mock.
  ///
  /// In en, this message translates to:
  /// **'12 entries logged'**
  String get transactions12Mock;

  /// No description provided for @emergencyReserve.
  ///
  /// In en, this message translates to:
  /// **'Emergency Reserve'**
  String get emergencyReserve;

  /// No description provided for @emergencyReserveSub.
  ///
  /// In en, this message translates to:
  /// **'Savings • Fixed Deposit'**
  String get emergencyReserveSub;

  /// No description provided for @tagLockedVault.
  ///
  /// In en, this message translates to:
  /// **'Locked Vault'**
  String get tagLockedVault;

  /// No description provided for @untouchedMonthMock.
  ///
  /// In en, this message translates to:
  /// **'Untouched this month'**
  String get untouchedMonthMock;

  /// No description provided for @availableBalance.
  ///
  /// In en, this message translates to:
  /// **'Available Balance'**
  String get availableBalance;

  /// No description provided for @proUpgradeTitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock Unlimited Freedom'**
  String get proUpgradeTitle;

  /// No description provided for @proUpgradeDesc.
  ///
  /// In en, this message translates to:
  /// **'Smart financial insights, auto-receipt scanning, unlimited custom categories, and encrypted cloud backup.'**
  String get proUpgradeDesc;

  /// No description provided for @proFeature1.
  ///
  /// In en, this message translates to:
  /// **'Unlimited KHQR & Receipt OCR Scanning'**
  String get proFeature1;

  /// No description provided for @proFeature2.
  ///
  /// In en, this message translates to:
  /// **'Private Encrypted Cloud Sync'**
  String get proFeature2;

  /// No description provided for @proFeature3.
  ///
  /// In en, this message translates to:
  /// **'Advanced Tax & Expense Export'**
  String get proFeature3;

  /// No description provided for @proFeature4.
  ///
  /// In en, this message translates to:
  /// **'Unlimited Custom Categories & Multi-wallets'**
  String get proFeature4;

  /// No description provided for @proFeature5.
  ///
  /// In en, this message translates to:
  /// **'Custom Live NBC & Market Exchange Rates'**
  String get proFeature5;

  /// No description provided for @proPlanMonthly.
  ///
  /// In en, this message translates to:
  /// **'KH Pro Monthly'**
  String get proPlanMonthly;

  /// No description provided for @proPlanYearly.
  ///
  /// In en, this message translates to:
  /// **'KH Pro Annual'**
  String get proPlanYearly;

  /// No description provided for @proPlanMonthShort.
  ///
  /// In en, this message translates to:
  /// **'/ mo'**
  String get proPlanMonthShort;

  /// No description provided for @proPlanYearShort.
  ///
  /// In en, this message translates to:
  /// **'/ year'**
  String get proPlanYearShort;

  /// No description provided for @proSaveTag.
  ///
  /// In en, this message translates to:
  /// **'BEST VALUE • SAVE 35%'**
  String get proSaveTag;

  /// No description provided for @proStartTrialBtn.
  ///
  /// In en, this message translates to:
  /// **'Pay with Bakong KHQR'**
  String get proStartTrialBtn;

  /// No description provided for @proMaybeLaterBtn.
  ///
  /// In en, this message translates to:
  /// **'Maybe Later'**
  String get proMaybeLaterBtn;

  /// No description provided for @proStarterFree.
  ///
  /// In en, this message translates to:
  /// **'Starter Free'**
  String get proStarterFree;

  /// No description provided for @proStarterFreeDesc.
  ///
  /// In en, this message translates to:
  /// **'Basic offline logs (up to 40 txns/mo)'**
  String get proStarterFreeDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'km'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'km':
      return AppLocalizationsKm();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
