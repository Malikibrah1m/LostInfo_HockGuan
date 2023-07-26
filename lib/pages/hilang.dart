// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:hockguan/layouts/user.dart';

import 'package:flutter/material.dart';

class HilangPage extends StatelessWidget {
  const HilangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return UserLayout(
      title: 'Barang Hilang',
      children: Center(
        child: Text('Barang Hilang'),
      ),
    );
  }
}
