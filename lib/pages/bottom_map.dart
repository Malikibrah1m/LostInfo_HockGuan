import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class FullScreenMapPage extends StatefulWidget {
  @override
  _FullScreenMapPageState createState() => _FullScreenMapPageState();
}

class _FullScreenMapPageState extends State<FullScreenMapPage> {
  GoogleMapController? _controller;
  Position? _currentPosition;
  bool _isMapMoved = false;

  final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(
        -8.1243, 113.2244), // Koordinat Lumajang sebagai contoh posisi awal
    zoom: 16.0,
  );

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
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

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _goToMyLocation() {
    if (_currentPosition != null) {
      _controller!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 16.0,
          ),
        ),
      );
    }
  }

  void _onCameraMoveStarted() {
    setState(() {
      _isMapMoved = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled:
                false, // Set to false to hide default "My Location" button
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: _onMapCreated,
            onCameraMoveStarted:
                _onCameraMoveStarted, // Event to track if the map is moved
            markers: {
              if (_currentPosition != null)
                Marker(
                  markerId: MarkerId('current_location'),
                  position: LatLng(
                      _currentPosition!.latitude, _currentPosition!.longitude),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueAzure),
                  infoWindow: InfoWindow(title: 'Lokasi Saya'),
                ),
            },
          ),
          if (_isMapMoved) // Show "My Location" button only when the map is moved
            Positioned(
              bottom: 280,
              right: 13,
              child: FloatingActionButton(
                heroTag: 'lokasiku',
                onPressed: _goToMyLocation,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.my_location,
                  color: Colors.black,
                ),
                mini: true,
              ),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height *
                    0.3, // 30% dari tinggi layar
                child: Center(
                  child: Text('Tampilkan Bottom Sheet'),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 280,
            left: 13,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                Navigator.pop(context);
              },
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
