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
    return Drawer(
      child: Column(
        children: [
          Container(
            // width: double.infinity,
            height: 180,
            color: Colors.blue[400],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'asset/lost2.png',
                        height: 60,
                        width: 60,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lost Info',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Platform Informasi Barang Hilang',
                            style: TextStyle(fontSize: 15, color: Colors.white),
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
              padding: EdgeInsets.only(top: 10),
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Beranda', style: TextStyle(fontSize: 17),),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.do_not_disturb_alt),
                  title: Text('Barang Hilang', style: TextStyle(fontSize: 17),),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HilangPage(),));
                  },
                ),
                 ListTile(
                  leading: Icon(Icons.archive_outlined),
                  title: Text('Barang Temuan', style: TextStyle(fontSize: 17),),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TemuanPage(),));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person_outline),
                  title: Text('Pengaturan Akun', style: TextStyle(fontSize: 17),),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AkunPage(),));
                  },
                ),
                Divider(color: Colors.black, height: 2),
                SizedBox(height: 20,),
                 ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Keluar', style: TextStyle(fontSize: 17),),
                  onTap: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                ),
              ],
            ) )
        ],
      ),
    );
  }
}
