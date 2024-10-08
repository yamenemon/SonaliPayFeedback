import 'package:feedback_sonalipay/navigation_service.dart';
import 'package:feedback_sonalipay/user_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding
  //     .ensureInitialized(); // IMPORTANT FOR INITIALIZING PROJECT WHILE ADDING FIREBASE

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(
    ProviderScope(
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService().navigationKey,
      home: Scaffold(
        body: Center(
          child: UserType(),
        ),
      ),
    );
  }
}
