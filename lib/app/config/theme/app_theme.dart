import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  final ThemeData theme = ThemeData();
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorScheme:
            theme.colorScheme.copyWith(secondary: AppColors.accentColor),
        primaryColor: AppColors.primaryColor,
        primarySwatch: AppColors.inputColor,
        appBarTheme: const AppBarTheme(
            centerTitle: true, titleTextStyle: TextStyle(fontSize: 16)),
        scaffoldBackgroundColor: Colors.grey.shade100,
        inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            focusColor: AppColors.inputColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(
                  color: AppColors.inputColor,
                )),
            labelStyle: const TextStyle(color: Colors.black87)),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            // primary: AppColors.inputColor, @deprecated se usa foregroundColor
            foregroundColor: AppColors.inputColor,
          ),
        ),
        listTileTheme: ListTileThemeData(
            dense: true,
            visualDensity: VisualDensity.compact,
            subtitleTextStyle: AppTextStyles.labelSmall.copyWith(),
            titleTextStyle: AppTextStyles.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            )),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent,
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.accentColor)),
        filledButtonTheme: FilledButtonThemeData(
            style:
                FilledButton.styleFrom(backgroundColor: AppColors.accentColor)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.accentColor,
        ),
        checkboxTheme: const CheckboxThemeData(
            checkColor: WidgetStatePropertyAll(
          Colors.white,
        )),
        textTheme: TextTheme(
          titleLarge: AppTextStyles.titleLarge,
          titleMedium: AppTextStyles.titleMedium,
          titleSmall: AppTextStyles.titleSmall,
          bodyLarge: AppTextStyles.bodyLarge,
          bodyMedium: AppTextStyles.bodyMedium,
          bodySmall: AppTextStyles.bodySmall,
          labelSmall: AppTextStyles.labelSmall,

          // por defecto
          displayLarge: ThemeData.light().textTheme.displayLarge,
          displayMedium: ThemeData.light().textTheme.displayMedium,
          displaySmall: ThemeData.light().textTheme.displaySmall,
          headlineMedium: ThemeData.light().textTheme.headlineMedium,
          headlineSmall: ThemeData.light().textTheme.headlineSmall,
          labelLarge: ThemeData.light().textTheme.labelLarge,
        ),
      );
}
