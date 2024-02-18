// ignore_for_file: unused_import

import 'dart:io';

import 'package:attendance/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:attendance/Pages/Admin/bottomNavigation.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyDQr-Hs5uCJSmsEVzoX4rVVIIz5Ht6VN64',
              appId: '1:1055544815856:android:4899c44d2089cd71679235',
              messagingSenderId: '1055544815856',
              projectId: 'chess-attendace'))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black12),
        useMaterial3: true,
      ),
      home: const SignUp(),
    );
  }
}
