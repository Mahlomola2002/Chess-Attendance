// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:attendance/Pages/Admin/QrScanner.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  String selectedPage = '';
  int currentPageIndex = 0;
  final List<Map<String, String>> data = [
    {'name': 'John', 'percentage': '30%'},
    {'name': 'Sarah', 'percentage': '50%'},
    {'name': 'David', 'percentage': '90%'},
    {'name': 'Pule', 'percentage': '10%'},
    {'name': 'Lovers', 'percentage': '8%'},
    {'name': 'Guc', 'percentage': '0%'},
    {'name': 'Gofd', 'percentage': '20%'},
    {'name': 'LOL', 'percentage': '11%'},
    {'name': 'John', 'percentage': '30%'},
    {'name': 'Sarah', 'percentage': '50%'},
    {'name': 'David', 'percentage': '90%'},
    {'name': 'Pule', 'percentage': '10%'},
    {'name': 'Lovers', 'percentage': '8%'},
    {'name': 'Guc', 'percentage': '0%'},
    {'name': 'Gofd', 'percentage': '20%'},
    {'name': 'LOL', 'percentage': '11%'},
  ];

  Widget _buildItem(Map<String, String> itemData) {
    if (itemData.isNotEmpty) {
      return Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                itemData['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Percentage: ${itemData['percentage']}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox(); // Return an empty SizedBox if itemData is empty
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 240, 238),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      // Implement your search logic here
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Implement your search functionality here
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildItem(data[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
