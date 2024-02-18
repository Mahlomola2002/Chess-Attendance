// ignore_for_file: unused_import, depend_on_referenced_packages, unnecessary_cast, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:attendance/Pages/Admin/QrScanner.dart';
import 'package:attendance/Pages/Admin/AdminHome.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart' as Material;

import '../../LoginScreen.dart'; // Alias the material package
// Keep fluent_ui as is

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentPageIndex = 0;
  late String selectedPage;
  final List<Widget> options = [
    const AdminHome(),
    QRViewExample(),
    Text('Ticket'),
  ];

  @override
  void initState() {
    super.initState();
    selectedPage = 'Home';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UCT chess attendance'),
        backgroundColor: const Color.fromRGBO(214, 94, 198, 0),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 70.0)),
            Material.ListTile(
              // Use Material.ListTile with the alias
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  selectedPage = 'Profile';
                  currentPageIndex = 0;
                });
              },
            ),
            Material.ListTile(
              // Use Material.ListTile with the alias
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  selectedPage = 'Settings';
                  currentPageIndex = 1;
                });
              },
            ),
            Material.ListTile(
              // Use Material.ListTile with the alias
              leading: const Icon(Icons.feedback),
              title: const Text('Feedback'),
              onTap: () {
                setState(() {
                  selectedPage = 'Feedback';
                  currentPageIndex = 2;
                });
              },
            ),
            Material.ListTile(
              // Use Material.ListTile with the alias
              leading: const Icon(Icons.logout),
              title: const Text('Log out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
            switch (index) {
              case 0:
                selectedPage = 'Home';
                break;
              case 1:
                selectedPage = 'Scan';
                break;
              case 2:
                selectedPage = 'Profile';
                break;
            }
          });
        },
        indicatorColor: Color.fromARGB(255, 122, 221, 208),
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(FluentIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.q_r_code),
            label: 'Scan',
          ),
          NavigationDestination(
            icon: Icon(FluentIcons.profile_search),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(child: options[currentPageIndex]),
    );
  }
}
