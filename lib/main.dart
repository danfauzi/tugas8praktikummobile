import 'package:flutter/material.dart';
import 'package:tugas8/homepage.dart';
import 'package:tugas8/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeprovider, child) {
        return MaterialApp(
          title: 'Demo Tema Aplikasi',
          theme: ThemeData.light(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeprovider.themeMode,
          debugShowCheckedModeBanner: false,
          home: const Homepage(),
        );
      }
    );
  }
}