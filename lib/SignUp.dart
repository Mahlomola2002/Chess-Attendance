// ignore_for_file: file_names, unused_import, library_private_types_in_public_api, unused_field, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, depend_on_referenced_packages, use_build_context_synchronously

import 'package:attendance/Pages/Admin/bottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:attendance/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:attendance/Firebase/auth.dart';
import 'package:attendance/Pages/Admin/AdminHome.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _committeeIDController = TextEditingController();
  String selectedOption = 'student';

  final _form = GlobalKey<FormState>();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _committeeIDController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Sign up Type:',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedOption = 'Comm Member';
                  });
                },
                child: Text('Comm Member'),
              ),
              SizedBox(width: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedOption = 'Student';
                  });
                },
                child: Text('Student'),
              ),
            ],
          ),
          SizedBox(height: 20),
          selectedOption.isNotEmpty
              ? selectedOption == 'Comm Member'
                  ? CommMemberForm()
                  : StudentForm()
              : Container(),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 7.0, left: 7.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "have an account? Sign in",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class StudentForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign up as a student',
          style: TextStyle(fontSize: 18),
        ),
        // Add Student form fields here
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
                    decoration: InputDecoration(labelText: 'Student Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Student number';
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
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(
                  height: 7,
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
                  width:
                      double.infinity, // Make the container take the full width
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
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CommMemberForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _committeeIDController = TextEditingController();
  final _emailController = TextEditingController();
  final Firebase _auth = Firebase();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign up as comm member',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 7,
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
                    decoration: InputDecoration(labelText: 'Student Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Student number';
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
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
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
                    controller: _committeeIDController,
                    decoration: InputDecoration(labelText: 'Comm ID'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Comm ID';
                      } else if (value != "UCT2024") {
                        return 'Please enter correct ID';
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
                  width:
                      double.infinity, // Make the container take the full width
                  padding: EdgeInsets.only(left: 7.0, right: 7.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 244, 252, 250),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () => signUp(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
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
                    child: Text('Sign Up'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  void signUp(BuildContext context) async {
    String email = _usernameController.text;
    String password = _passwordController.text;
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    if (user != null) {
      print("user is created");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomBar()),
      );
    }
  }
}
