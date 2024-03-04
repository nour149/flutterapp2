import 'dart:convert';
import 'dart:io';
import 'package:desktop_app/HomeScreen.dart';
import 'package:desktop_app/api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:system_tray/system_tray.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static const route = '/signin';

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AppWindow appWindow = AppWindow();
  final SystemTray systemTray = SystemTray();

  @override
  void initState() {
    super.initState();
    initSystemTray();
  }

  Future<void> initSystemTray() async {
    String path = Platform.isWindows ? 'assets/app_icon.ico' : 'assets/app_icon.png';

    // Initialize the system tray.
    await systemTray.initSystemTray(
      title: "System Tray",
      iconPath: path,
    );

    // Create context menu.
    final Menu menu = Menu();
    await menu.buildFrom([
      MenuItemLabel(label: 'Show', onClicked: (menuItem) => appWindow.show()),
      MenuItemLabel(label: 'Hide', onClicked: (menuItem) => appWindow.hide()),
      MenuItemLabel(label: 'Exit', onClicked: (menuItem) => appWindow.close()),
    ]);

    // Set context menu.
    await systemTray.setContextMenu(menu);

    // Handle system tray event.
    systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == kSystemTrayEventClick) {
        Platform.isWindows ? appWindow.show() : systemTray.popUpContextMenu();
      } else if (eventName == kSystemTrayEventRightClick) {
        Platform.isWindows ? systemTray.popUpContextMenu() : appWindow.show();
      }
    });
  }

  login() async {
    var data = {
      'username': usernameController.text,
      'password': passwordController.text,
    };

    var res = await Api().login(data);
    var body = json.decode(res.body);

    if (body['code'] == 401) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid Credentials')));
    }

    if (body['token'] != null) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', body['token']);

      // Hide the main application window
      appWindow.hide(); // Assuming `appWindow` is your AppWindow instance

      // Optionally, navigate to the HomeScreen or perform other actions
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  // void navigateToSignUp() {
  //   Navigator.pushNamed(context, SignUp.route);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter-Symfony Rest API'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
                labelStyle: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: passwordController,
              obscureText: true, // This hides the password
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
                labelStyle: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            // const SizedBox(height: 16),
            // Align(
            //   alignment: Alignment.center,
            //   child: TextButton(
            //     onPressed: navigateToSignUp,
            //     child: const Text(
            //       'Sign Up',
            //       style: TextStyle(fontSize: 16),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}