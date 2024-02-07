

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  // Login expiration duration (e.g., 4 hours)
  static const int loginExpirationHours = 4;

  Future<Map<String, dynamic>> userLogin(String username, String password, BuildContext context) async {
    final loginUrl = Uri.parse("https://fakestoreapi.com/auth/login");
    try {
      final response = await http.post(loginUrl, body: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Store login data and timestamp in shared preferences
        await _storeLoginData(response.body);
        return json.decode(response.body);
      } else {
        _showErrorDialog(context, 'Failed to login. Please try again.');
        return {};
      }
    } catch (e) {
      _showErrorDialog(context, 'An error occurred: $e');
      return {};
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _storeLoginData(String responseBody) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final loginData = json.decode(responseBody);

    final accessToken = loginData['token']; // Access the token value

    // Store login data
    await sharedPreferences.setString('accessToken', accessToken);

    // Store login timestamp
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    await sharedPreferences.setInt('loginTime', currentTime);
  }

  Future<Map<String, dynamic>?> getStoredLoginData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final accessToken = sharedPreferences.getString('accessToken');
    final loginTime = sharedPreferences.getInt('loginTime');

    if (accessToken != null && loginTime != null) {
      // Check if the login timestamp is within the expiration duration
      final currentTime = DateTime.now().millisecondsSinceEpoch;
      final elapsedTime = (currentTime - loginTime) ~/ (1000 * 60 * 60); // Hours

      if (elapsedTime <= loginExpirationHours) {
        return {'accessToken': accessToken};
      }
    }
return null;
    // If login data is expired or not available, return null
    
  }
}
