// import 'dart:convert';

// import 'package:desktop_app/HomeScreen.dart';
// import 'package:desktop_app/api.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   static const route = '/signup';

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();

//   signUp() async {
//   if (passwordController.text != confirmPasswordController.text) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Passwords do not match')),
//     );
//     return;
//   }

//   var data = {
//     // 'username': usernameController.text,
//     // 'password': passwordController.text,
//     // 'firstName': firstNameController.text,
//     // 'lastName': lastNameController.text,
//     // 'email': emailController.text,
//     // 'tel': telController.text,
//     'enabled': true, // or set to false based on your requirements
//     'blocked': false, // or set to true based on your requirements
//     'avatar': '', // Add the URL or image data if available
//     'token': '', // Provide token if needed
//     'tokenCreation': '', // Provide token creation date if needed
//     'activationCode': '', // Provide activation code if needed
//     'color': '', // Add user color if needed
//     'roles': ['ROLE_USER'], // Default role is ROLE_USER
//     // Add other fields as needed by your backend
//   };

//   var res = await Api().register(data);
//   var body = json.decode(res.body);

//   if (body['userId'] != null) {
//     // Registration successful
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     localStorage.setString('userId', body['userId']);

//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => HomeScreen()),
//     );
//   } else {
//     // Registration failed
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Registration failed. Please try again.')),
//     );
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter-Symfony Rest API'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: usernameController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Username',
//                 labelStyle: TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 24),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Password',
//                 labelStyle: TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 24),
//             TextField(
//               controller: confirmPasswordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Confirm Password',
//                 labelStyle: TextStyle(fontSize: 18),
//               ),
//             ),
//             const SizedBox(height: 24),
//             Align(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                 onPressed: () {
//                   signUp();
//                 },
//                 child: const Text(
//                   'Sign Up',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }
