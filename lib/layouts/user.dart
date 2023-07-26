// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import '/widgets/drawer.dart';
import 'package:flutter/material.dart';

class UserLayout extends StatelessWidget {
  const UserLayout({super.key, required this.children, required this.title});

  final String title;
  final Widget children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        shadowColor: Colors.green,
        title: Text(
          title,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: CustomDrawer(),
      body: children,
    );
  }
}

