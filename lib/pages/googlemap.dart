  import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:geolocator/geolocator.dart';
  import 'package:permission_handler/permission_handler.dart';
  import 'package:app_settings/app_settings.dart';

  class GoogleMapsScreen extends StatefulWidget {
    @override
    State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
  }

  class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
    GoogleMapController? _controller;
    Position? _currentPosition;
    final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-8.1243, 113.2244), // Koordinat Lumajang sebagai contoh posisi awal
    zoom: 15.0,
  );

    @override
    void initState() {
      super.initState();
      _checkLocationPermission();
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
          _controller!.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
                zoom: 15.0,
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
        backgroundColor: Colors.transparent,
        body: _currentPosition == null
            ? CircularProgressIndicator()
            : GoogleMap(              
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
                    position: LatLng(
                        _currentPosition!.latitude, _currentPosition!.longitude),
                    infoWindow: InfoWindow(title: 'Lokasi Anda'),
                  ),
                  
                },
                
              ),
            
      );
    }
  }
