import 'package:flutter/foundation.dart';
import '../models/expense.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<Expense> _expenses = [];

  ExpenseProvider() {
    // Seed with initial mock data so it doesn't look empty
    _expenses.addAll([
      Expense(
        id: '1',
        amount: 4.50,
        currency: 'USD',
        usdAmount: 4.50,
        khrAmount: 18500,
        category: 'Food',
        paymentMethod: 'Cash',
        date: DateTime.now().subtract(const Duration(minutes: 45)),
        notes: 'Khmer Noodle Soup (Nom Banh Chok)',
      ),
      Expense(
        id: '2',
        amount: 2.00,
        currency: 'USD',
        usdAmount: 2.00,
        khrAmount: 8200,
        category: 'Transport',
        paymentMethod: 'ABA Pay',
        date: DateTime.now().subtract(const Duration(hours: 3)),
        notes: 'PassApp Rickshaw',
      ),
      Expense(
        id: '3',
        amount: 2.50,
        currency: 'USD',
        usdAmount: 2.50,
        khrAmount: 10200,
        category: 'Food',
        paymentMethod: 'Bakong KHQR',
        date: DateTime.now().subtract(const Duration(hours: 5)),
        notes: 'Brown Coffee / Iced Latte',
      ),
      Expense(
        id: '4',
        amount: 18.20,
        currency: 'USD',
        usdAmount: 18.20,
        khrAmount: 74500,
        category: 'Shopping',
        paymentMethod: 'Wing Bank',
        date: DateTime.now().subtract(const Duration(days: 1)),
        notes: 'Aeon Mart Groceries',
      ),
    ]);
  }

  List<Expense> get expenses => _expenses;

  // Recent expenses sorted by date
  List<Expense> get recentExpenses {
    final sorted = List<Expense>.from(_expenses)
      ..sort((a, b) => b.date.compareTo(a.date));
    return sorted;
  }

  List<Expense> getExpensesForPeriod(String period) {
    final now = DateTime.now();
    return _expenses.where((e) {
      if (period == 'Today') {
        return e.date.year == now.year && e.date.month == now.month && e.date.day == now.day;
      } else if (period == 'This Week' || period == 'Week') {
        final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
        final startDate = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);
        return e.date.isAfter(startDate.subtract(const Duration(milliseconds: 1)));
      } else if (period == 'Year') {
        return e.date.year == now.year;
      } else {
        return e.date.year == now.year && e.date.month == now.month;
      }
    }).toList();
  }

  double totalUSDSpendingForPeriod(String period) {
    return getExpensesForPeriod(period).fold(0.0, (sum, item) => sum + item.usdAmount);
  }

  double get totalUSDSpending {
    return _expenses.fold(0.0, (sum, item) => sum + item.usdAmount);
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void updateExpense(Expense expense) {
    final index = _expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1) {
      _expenses[index] = expense;
      notifyListeners();
    }
  }
}
