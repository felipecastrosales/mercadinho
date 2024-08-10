import 'package:flutter/material.dart';

import 'src/pages/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercadinho',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        hoverColor: Colors.green[100],
        scaffoldBackgroundColor: Colors.white.withAlpha(190),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.green,
          selectionColor: Colors.green,
          selectionHandleColor: Colors.green,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.green,
          textTheme: ButtonTextTheme.primary,
          hoverColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            overlayColor: Colors.green[100],
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[100],
            overlayColor: Colors.green[800],
            textStyle: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            overlayColor: Colors.green[800],
            iconColor: Colors.green[900],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            side: const BorderSide(
              width: 2,
              color: Colors.green,
            ),
            textStyle: const TextStyle(
              color: Colors.green,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          outlineBorder: const BorderSide(
            color: Colors.green,
            width: 2,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          labelMedium: TextStyle(
            color: Colors.green[900],
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            color: Colors.green[900],
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.green,
        ),
        dialogBackgroundColor: Colors.white,
        dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
      ),
      home: const SignInScreen(),
    );
  }
}
