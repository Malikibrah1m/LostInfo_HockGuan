import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hockguan/pages/bottom_map.dart';
import 'package:hockguan/widgets/drawer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:app_settings/app_settings.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;
  int _currentIndex = 0;
  final double cardWidth = 300.0;
  final int itemCount = 5;
  GoogleMapController? _controller;
  Position? _currentPosition;
  final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(
        -8.1243, 113.2244), // Koordinat Lumajang sebagai contoh posisi awal
    zoom: 12.0,
  );
  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    _checkLocationPermission();
  }

  @override
  void dispose() {
    _stopAutoScroll();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentIndex <= itemCount - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollToIndex(_currentIndex);
    });
  }

  void _stopAutoScroll() {
    _scrollTimer?.cancel();
  }

  void _scrollToIndex(int index) {
    _scrollController.animateTo(
      index * cardWidth, // 250.0 adalah tinggi dari setiap item di ListView
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  _checkLocationPermission() async {
    PermissionStatus status = await Permission.locationWhenInUse.status;
    if (!status.isGranted) {
      if (await Permission.locationWhenInUse.request().isGranted) {
        _getCurrentLocation();
      } else if (status.isDenied) {
        print("Izin lokasi ditolak oleh pengguna.");
      } else if (status.isPermanentlyDenied) {
        print("Izin lokasi ditolak secara permanen oleh pengguna.");
        _showLocationPermissionDialog();
      }
    } else {
      _getCurrentLocation();
    }
  }

  _showLocationPermissionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Izin Lokasi Diperlukan"),
          content: Text(
              "Aplikasi membutuhkan izin akses lokasi untuk dapat menampilkan lokasi Anda di peta."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Tutup"),
            ),
            TextButton(
              onPressed: () {
                AppSettings.openAppSettings();
                Navigator.of(context).pop();
              },
              child: Text("Buka Pengaturan"),
            ),
          ],
        );
      },
    );
  }

  _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
        if (_controller != null) {
          _controller!.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(
                    _currentPosition!.latitude, _currentPosition!.longitude),
                zoom: 16.0,
              ),
            ),
          );
        }
      });
    } catch (e) {
      print("Error while getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        shadowColor: Colors.green,
        title: Text(
          'Beranda',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: itemCount,
                itemBuilder: (context, index) {
                  return Center(
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: SizedBox(
                          width: cardWidth,
                          height: 250,
                          child: ListTile(
                            leading: Text(
                              'Judul item $index',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            title: Image.network(
                                'https://picsum.photos/seed/picsum/536/354'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: GoogleMap(
                          myLocationButtonEnabled: true,
                          initialCameraPosition: _initialCameraPosition,
                          onMapCreated: (controller) {
                            _controller = controller;
                            _getCurrentLocation();
                          },
                          markers: {
                            if (_currentPosition != null)
                              Marker(
                                markerId: MarkerId('current_location'),
                                position: LatLng(_currentPosition!.latitude,
                                    _currentPosition!.longitude),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueAzure),
                                infoWindow: InfoWindow(title: 'Lokasi Saya'),
                              ),
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 3, color: Colors.blue)),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FullScreenMapPage(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.not_listed_location,
                          color: Colors.blue,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
