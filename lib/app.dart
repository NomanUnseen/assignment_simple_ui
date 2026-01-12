import 'hangout_home_screen.dart';
import 'package:flutter/material.dart';



class HangoutBangladeshApp extends StatelessWidget {
  const HangoutBangladeshApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hangout Bangladesh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HangoutHomeScreen(),
    );
  }
}