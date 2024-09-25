import 'package:flutter/material.dart';
import 'package:uttoron_app/Screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        
        colorScheme: ColorScheme.fromSeed(
          background: const Color.fromARGB(120, 90, 90, 90),
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 123, 34, 141),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

