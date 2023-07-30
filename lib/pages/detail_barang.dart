import 'package:flutter/material.dart';
import 'package:hockguan/pages/googlemap.dart';

class DetailBarang extends StatelessWidget {
  const DetailBarang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
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
                              'Detail Barang',
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
                            Expanded(child: Text('Nama Pemilik')),
                            Text(':'),
                            SizedBox(width: 10,),
                            Expanded(child: Text('Nama barang yang Hilang'))
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child: Text('Nama Pemilik')),
                            Text(':'),
                            SizedBox(width: 10,),
                            Expanded(child:  InkWell(
                                        child: Text(
                                          'Nama Pemilik',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onTap: () {},
                                      ),)
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Text('Foto Barang'),
                            SizedBox(width: 50,),
                            Text(':'),
                            SizedBox(width: 10,),
                            Expanded(child: Container(height: 200,
                            width: double.infinity,
                              child: Image.network('https://picsum.photos/seed/picsum/200/300', fit: BoxFit.cover,)))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child: Text('Hadiah')),
                            Text(':'),
                            SizedBox(width: 10,),
                            Expanded(child: Text('Rp. 100.000'))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child: Text('Status')),
                            Text(':'),
                            SizedBox(width: 10,),
                            Expanded(child: Text('Belum Ditemukan'))
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child: Text('Tanggal Hilang')),
                            Text(':'),
                            SizedBox(width: 10,),
                            Expanded(child: Text('Tanggal Hilang'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
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
                          children: [
                            Text('Tempat Hilang', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 10,),
                            Container(
                              height: 300,
                              width: double.infinity,
                              child: GoogleMapsScreen(),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [ElevatedButton(onPressed: () {
                                
                              }, child: Text('Pergi ke lokasi'))],
                            )
                          ],
                        ),
                )
              ],
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
             children: [
               Padding(
                 padding: EdgeInsets.only(right: 15),
                 child: FloatingActionButton(
                  heroTag: 'Email',
                   onPressed: () {
                   },
                   backgroundColor: Colors.blueAccent,
                   child: Icon(
                     Icons.email,
                     color: Colors.white,
                   ),
                 ),
               ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 15),
            child: FloatingActionButton(
              heroTag: 'Whatsapp',
              onPressed: () {
              },
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
          ),
             ],
           ),
          
        ],
      ),
    );
  }
}
