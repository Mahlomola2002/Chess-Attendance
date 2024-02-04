// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess Club Attendance'),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Image.asset(
                      'assets/chess.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  SizedBox(height: 0),
                  Text(
                    "Attendance",
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 24, 45, 61),
                    ),
                  ),
                  SizedBox(height: 1),
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 7.0, right: 7.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 252, 250),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 7.0, right: 7.0),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 252, 250),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ]),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 0),
                  // Wrap the ElevatedButton with a Container to control its width
                  Container(
                    width: double
                        .infinity, // Make the container take the full width
                    padding: EdgeInsets.only(left: 7.0, right: 7.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 244, 252, 250),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // Form is valid, perform sign-in logic here
                          String username = _usernameController.text;
                          String password = _passwordController.text;
                          print(
                              'Signing in with username: $username, password: $password');
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                            // Check if the password field is not empty
                            if (_passwordController.text.isNotEmpty) {
                              // Return the color you want when the password is entered
                              return Colors.blue;
                            }
                            // Return the default color when the password is not entered
                            return Colors
                                .grey; // You can replace this with the color you prefer
                          },
                        ),
                      ),
                      child: Text('Sign In'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print("hello");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 7.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              print("hello");
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 7.0, left: 7.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Don't have an account? Sign up",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
