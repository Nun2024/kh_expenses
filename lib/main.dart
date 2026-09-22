import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/screens/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KH Expense',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const DashboardScreen(),
    );
  }
}
