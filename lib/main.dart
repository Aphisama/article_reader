import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/settings_provider.dart';
import 'pages/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Article Reader',
          theme: settings.isDarkMode ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
