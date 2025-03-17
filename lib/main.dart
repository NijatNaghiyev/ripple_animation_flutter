import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ripple_animation_flutter/screens/my_home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Ripple Animation', home: const MyHomeScreen());
  }
}
