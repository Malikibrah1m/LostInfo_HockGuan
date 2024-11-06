// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:hockguan/layouts/user.dart';
import 'package:hockguan/pages/detail_barang.dart';
import 'package:hockguan/pages/tambah_barang.dart';

// ignore: unused_import
import '/widgets/drawer.dart';
import 'package:flutter/material.dart';

class TemuanPage extends StatefulWidget {
  const TemuanPage({super.key});

  @override
  State<TemuanPage> createState() => _TemuanPageState();
}

class _TemuanPageState extends State<TemuanPage> {
  TextEditingController _searchController = TextEditingController();
  String _selectedFilter = 'Semua Barang';

  List<String> _barangList = [
    'Barang 1',
    'Barang 2',
    'Barang 3',
    'Barang 4',
    'Barang 5',
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<String> _filteredBarangList() {
    if (_selectedFilter == 'Semua Barang') {
      return _barangList;
    } else {
      return _barangList
          .where((barang) => barang.contains(_selectedFilter))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return UserLayout(
      title: 'Barang Temuan',
      children: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(size.width * 0.02),
              child: Column(
                children: [
                  // Pencarian
                  Padding(
                    padding: EdgeInsets.all(size.width * 0.02),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Cari Barang',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                  ),

                  // Filter Barang
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(_selectedFilter),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedFilter,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _selectedFilter = newValue!;
                                });
                              },
                              items: [
                                'Semua Barang',
                                'Filter 1',
                                'Filter 2',
                                'Filter 3'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  // List Barang
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _filteredBarangList().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
                        child: Container(
                          padding: EdgeInsets.all(size.width * 0.04),
                          height: size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(0, 1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(size.width * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: size.height * 0.18,
                                  width: size.width * 0.35,
                                  child: Image.network(
                                    'https://picsum.photos/seed/picsum/200/300',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: size.width * 0.03),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nama Barang Temuan',
                                          style: TextStyle(
                                            fontSize: size.width * 0.045,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        InkWell(
                                          child: Text(
                                            'Nama Penemu',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onTap: () {},
                                        ),
                                        Text('Tanggal ditemukan'),
                                        InkWell(
                                          child: Text(
                                            'Lihat detail',
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * 0.04,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) => DetailBarang(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.05,
            right: size.width * 0.04,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TambahBarang(),
                ));
              },
              backgroundColor: Colors.blueAccent,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
