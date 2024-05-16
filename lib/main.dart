import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nike/UI/splashScreen/splashScreen.dart';
import 'package:get/get.dart';
import 'package:nike/UI/trail.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const SplashScreen(),
    );
  }
}

