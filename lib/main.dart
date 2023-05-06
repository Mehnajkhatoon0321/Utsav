import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utsavfashion/Screen/Splash_Screen/SplashScreen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setPreferredOrientations([
DeviceOrientation.portraitUp,
DeviceOrientation.portraitDown,
]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.system,
      theme: ThemeData(
        primarySwatch: Colors.pink,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch:Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: const splashscreen(),
    );
  }
}

