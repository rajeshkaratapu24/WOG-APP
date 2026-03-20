import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_theme.dart';
import 'src/controllers/home_controller.dart';
import 'src/ui/screens/home_screen.dart';

void main() {
  runApp(
    // Separate Controller/State Management
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        // Add Firebase connectors here later:
        // Provider(create: (_) => FirebaseService()),
      ],
      child: const WorldOfGodApp(),
    ),
  );
}

class WorldOfGodApp extends StatelessWidget {
  const WorldOfGodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World of God',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme(),
      home: const HomeScreen(),
    );
  }
}
