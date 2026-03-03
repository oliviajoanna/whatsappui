import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Inspired Messenger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.lightGreen,
          primary: AppColors.lightGreen,
          surface: AppColors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            color: AppColors.tealGreen,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}