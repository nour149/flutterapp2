
import 'package:desktop_app/HomeScreen.dart';
import 'package:desktop_app/SignIn.dart';
import 'package:desktop_app/TierListScreen.dart';
import 'package:flutter/material.dart';

void main() {
 // HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Blog app Symfony Backend ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SignIn.route: (context) => const SignIn(),
        HomeScreen.route: (context) => const HomeScreen(),
        '/tierList': (context) => TierListScreen(tierList: [],),
      },
      initialRoute: SignIn.route,
    );
  }
}


// import 'package:desktop_app/HomeScreen.dart';
// import 'package:desktop_app/SignIn.dart';
//  // Import TierListScreen.dart
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(home: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}); // Corrected the constructor syntax

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Blog app Symfony Backend ',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: {
//         SignIn.route: (context) => const SignIn(),
//         HomeScreen.route: (context) => const HomeScreen(),
//         TierListScreen.route: (context) => const TierListScreen(), // Add TierListScreen route
//       },
//       initialRoute: SignIn.route,
//     );
//   }
// }
