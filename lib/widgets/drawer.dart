// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:hockguan/pages/akun.dart';
import 'package:hockguan/pages/hilang.dart';
import 'package:hockguan/pages/home.dart';
import 'package:hockguan/pages/login.dart';
import 'package:hockguan/pages/temuan.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: size.height * 0.2,
            color: Colors.blue[400],
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          'asset/lost2.png',
                          height: size.height * 0.07,
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lost Info',
                            style: TextStyle(
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            'Platform Informasi Barang Hilang',
                            style: TextStyle(
                              fontSize: size.height * 0.018,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: size.height * 0.015),
              children: [
                ListTile(
                  leading: Icon(Icons.home, size: size.width * 0.07),
                  title: Text(
                    'Beranda',
                    style: TextStyle(fontSize: size.height * 0.022),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.do_not_disturb_alt, size: size.width * 0.07),
                  title: Text(
                    'Barang Hilang',
                    style: TextStyle(fontSize: size.height * 0.022),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HilangPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.archive_outlined, size: size.width * 0.07),
                  title: Text(
                    'Barang Temuan',
                    style: TextStyle(fontSize: size.height * 0.022),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TemuanPage()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_outline, size: size.width * 0.07),
                  title: Text(
                    'Pengaturan Akun',
                    style: TextStyle(fontSize: size.height * 0.022),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => AkunPage()),
                    );
                  },
                ),
                Divider(color: Colors.black, height: size.height * 0.002),
                SizedBox(height: size.height * 0.02),
                ListTile(
                  leading: Icon(Icons.logout, size: size.width * 0.07),
                  title: Text(
                    'Keluar',
                    style: TextStyle(fontSize: size.height * 0.022),
                  ),
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
