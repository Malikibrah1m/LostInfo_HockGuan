// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import '/widgets/drawer.dart';
import 'package:flutter/material.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        shadowColor: Colors.green,
        title: Text(
          'Pengaturan akun',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("Pengaturan akun"),
      ),
    );
  }
}

