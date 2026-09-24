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
