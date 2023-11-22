import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                _register();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
  
Future<void> _register() async {
  final String apiUrl = 'http://127.0.0.1:8000/register/';

  try {
    // Fetch CSRF token from Django
    final csrfResponse = await http.get(Uri.parse('http://127.0.0.1:8000/csrf/'));

    // Extract CSRF token from the response headers
    final List<String>? setCookieHeaders = csrfResponse.headers['set-cookie'] as List<String>?;
    final csrfToken = setCookieHeaders?.map((header) => header.split('; ')[0].split('=')[1]).firstWhere((element) => element.isNotEmpty, orElse: () => '') ?? '';

    // Make the registration request with the CSRF token
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRFToken': csrfToken,
      },
      body: jsonEncode({
        'username': _usernameController.text ?? '',
        'password': _passwordController.text ?? '',
      }),
    );

    if (response.statusCode == 201) {
      // Registration successful
      print('User registered successfully');
    } else {
      // Handle registration errors
      print('Registration failed: ${response.statusCode}');
      print(response.body);
    }
  } catch (error) {
    // Handle other errors, e.g., network issues
    print('Error during registration: $error');
  }
}



}
