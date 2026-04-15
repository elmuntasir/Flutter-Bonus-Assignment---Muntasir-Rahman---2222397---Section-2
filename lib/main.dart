import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/task_list_screen.dart';
// Note: You must run `flutterfire configure` to generate this file
// or manually add your firebase_options.dart
// import 'firebase_options.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Default initialization for platforms that don't use firebase_options.dart yet
  // or until the user runs flutterfire configure
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('Firebase initialization failed: $e');
    debugPrint('Make sure you have added google-services.json (Android) or GoogleService-Info.plist (iOS)');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bonus Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TaskListScreen(),
    );
  }
}
