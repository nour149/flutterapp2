
import 'package:desktop_app/HomeScreen.dart';
import 'package:desktop_app/SignIn.dart';
import 'package:desktop_app/TierListScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:screen_capturer/screen_capturer.dart';
import 'package:windows_notification/windows_notification.dart';
import 'package:windows_notification/notification_message.dart';


// Function to capture the screen
Future<void> captureScreen() async {
  try {
      final filename = DateTime.now().toIso8601String().replaceAll(RegExp(r'[^0-9]'), '_');
      print(filename);
    CapturedData? capturedData = await screenCapturer.capture(
      mode: CaptureMode.screen, // Or CaptureMode.screen for the entire screen
      imagePath: 'path/to/save/${filename}.png', // Replace with your desired path
      copyToClipboard: true,
    );
    print(capturedData?.imagePath);

    // if (capturedData != null) {
    //   // Handle successful capture, e.g., display a notification or use the screenshot data
    //   print('Screenshot captured successfully: ${capturedData.imagePath}');
    // }
  } catch (error) {
    // Handle capture errors
    print('Error capturing screenshot: $error');
  }
}

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));

  // Schedule automatic screen capture every 10 minutes
  Timer.periodic(const Duration(seconds: 600), (_) async {
    await captureScreen();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Blog app Symfony Backend ',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SignIn.route: (context) => const SignIn(),
        // SignUp.route: (context) => const SignUp(), // Add SignUp route
        HomeScreen.route: (context) => const HomeScreen(),
        '/tierList': (context) => TierListScreen(tierList: [],),
      },
      initialRoute: SignIn.route,
    );
  }
}






// void main() {
//  // HttpOverrides.global = new MyHttpOverrides();
//   runApp(MaterialApp(home: MyApp(), debugShowCheckedModeBanner: false,)); // This should hide the debug banner
//   setupPeriodicScreenshot();
//   scheduleNotification(Duration(minutes: 1)); // Schedule the notification 1 minute before the screenshot
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false, // Ensure it's set to false here as well
//       title: 'Flutter Symfony Backend ',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: {
//         SignIn.route: (context) => const SignIn(),
//         // SignUp.route: (context) => const SignUp(), // Add SignUp route
//         HomeScreen.route: (context) => const HomeScreen(),
//         '/tierList': (context) => TierListScreen(tierList: [],),
//       },
//       initialRoute: SignIn.route,
//     );
//   }
// } 

// void setupPeriodicScreenshot() {
//   Timer.periodic(const Duration(minutes: 10), (Timer t) async {
//     await captureAndSaveScreen();
//   });
// }

// Future<void> captureAndSaveScreen() async {
//   try {
//     final directory = await getApplicationDocumentsDirectory();
//     final fileName = "screenshot_${DateTime.now().toIso8601String()}.png";
//     final filePath = '${directory.path}/$fileName';

//     final capturedData = await screenCapturer.capture(
//       mode: CaptureMode.screen,
//     );

//     if (capturedData != null) {
//       final file = File(filePath);
//       await file.writeAsBytes(capturedData.data);
//     } else {
//       print('Failed to capture screenshot: No data captured');
//     }
//   } catch (e) {
//     print('Failed to capture screenshot: $e');
//   }
// }











// Future<void> captureAndSaveScreen() async {
//   final directory = await getApplicationDocumentsDirectory();
//   final fileName = "screenshot_${DateTime.now().toIso8601String()}.png";
//   final filePath = '${directory.path}/$fileName';

//   final capturedData = await screenCapturer.capture(
//     mode: CaptureMode.screen,
//     imagePath: filePath,
//     copyToClipboard: false,
//   );

//   if (capturedData != null && capturedData.imagePath != null && capturedData.imagePath!.isNotEmpty) {
//     print("Screenshot saved to ${capturedData.imagePath}");
//   } else {
//     print("Failed to capture screenshot.");
//   }
// }

final _winNotifyPlugin = WindowsNotification(applicationId: r"{D65231B0-B2F1-4857-A4CE-A8E7C6EA7D27}\WindowsPowerShell\v1.0\powershell.exe");

void scheduleNotification(Duration delay) {
  // create new NotificationMessage instance with id, title, body, and images
  NotificationMessage message = NotificationMessage.fromPluginTemplate(
    "test1",
    "Screenshot Alert",
    "A screenshot will be taken in one minute.",
    largeImage: 'path_to_large_image',
    image: 'path_to_small_image'
  );

  Future.delayed(delay, () {
    // show notification
    _winNotifyPlugin.showNotificationPluginTemplate(message);
  });
}
