// import 'package:flutter/material.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   static const route = '/home';

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter-Symfony Rest API'),
//       ),
//       body:  SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text(
//                 'Home Screen',
//                 style: TextStyle(fontSize: 20),
//               ),
//               Text(
//                 'Successfully logged',
//                 style: TextStyle(fontSize: 20),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:desktop_app/Tier.dart';
import 'package:desktop_app/TierListScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences package

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = '/home';

//  Future<void> _fetchTierList(BuildContext context) async {
//   try {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     String? token = localStorage.getString('token');

//     final response = await http.get(
//       Uri.parse('http://127.0.0.1:8000/api/tier/'),
//       headers: <String, String>{
//         'Authorization': 'Bearer $token',
//       },
//     );

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body) as List<dynamic>;
//       List<String> tierList = data.map((item) => item.toString()).toList();
//       Navigator.pushNamed(context, '/tierList', arguments: tierList);
//     } else {
//       throw Exception('Failed to load tier list');
//     }
//   } catch (e) {
//     print('Error: $e');
//   }
// }

Future<void> _fetchTierList(BuildContext context) async {
  try {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

    final response = await http.get(
      Uri.parse('http://127.0.0.1:8000/api/tier/'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    print('Response Body: ${response.body}'); // Print response body

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      List<Tier> tierList = data.map((item) {
        Tier tier = Tier.fromJson(item);
        print('Parsed Tier: $tier');
        return tier;
      }).toList();

      print('Received Tier List: $tierList');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TierListScreen(tierList: tierList),
        ),
      );

    } else {
      throw Exception('Failed to load tier list');
    }
  } catch (e) {
    print('Error: $e');
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter-Symfony Rest API'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Home Screen',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Successfully logged',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _fetchTierList(context);
                },
                child: Text('View Tier List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
