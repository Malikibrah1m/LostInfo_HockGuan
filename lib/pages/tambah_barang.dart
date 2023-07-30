// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hockguan/pages/googlemap.dart';

class TambahBarang extends StatelessWidget {
  const TambahBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    height: 70,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueGrey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Tambah Barang Hilang',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text('Nama Barang'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Masukkan nama barang yang hilang',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Deskripsi Barang'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    maxLines: null,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Masukkan nama barang yang hilang',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Lokasi Hilang'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              hintText: 'Tambahkan Lokasi',
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 1),
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors
                                    .blue), // Ganti warna latar belakang ke biru
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: GoogleMapsScreen(),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Foto'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(10))),
                              hintText: 'Tambahkan foto',
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 1),
                      SizedBox(
                        height: 50,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.attachment,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors
                                    .blue), // Ganti warna latar belakang ke biru
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: Center(
                      child: Image.asset(
                        'asset/polije.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Hadiah'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 1),
                      Container(
                        color: Colors.grey[200],
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Text(
                            'Rp',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(10))),
                              hintText: '100.000',
                              labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Status'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Masukkan status',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      children: [
                        Text('Tanggal Hilang'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Masukkan Tanggal',
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(style: ButtonStyle(fixedSize: MaterialStateProperty.all<Size>(Size(150, 30)),),
                          onPressed: () {}, child: Text('Simpan Data')),
                      ElevatedButton(
                          style: ButtonStyle(fixedSize: MaterialStateProperty.all<Size>(Size(150, 30)),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors
                                .white),
                                 overlayColor: MaterialStateProperty.all<Color>(Colors.blue.shade100), // Ganti warna latar belakang ElevatedButton
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Kembali',
                            style: TextStyle(color: Colors.black),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
