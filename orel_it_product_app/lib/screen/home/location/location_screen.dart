import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../../widget/appbar/default.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.subAdministrativeArea}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: DropdownButton(
      //     icon: const Icon(Icons.menu),
      //     items: const [
      //       DropdownMenuItem(
      //         value: 'option1',
      //         child: Text('Option 1'),
      //       ),
      //       DropdownMenuItem(
      //         value: 'option2',
      //         child: Text('Option 2'),
      //       ),
      //       DropdownMenuItem(
      //         value: 'option3',
      //         child: Text('Option 3'),
      //       ),
      //     ],
      //     onChanged: (value) {
      //       // Handle dropdown item selection
      //       print('Selected: $value');
      //     },
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 8.0),
      //       child: Stack(
      //         children: [
      //           IconButton(
      //             icon: const Icon(
      //               Icons.notifications_none_outlined,
      //               color: Colors.black,
      //             ),
      //             onPressed: () {
      //               // Handle notification icon press
      //               print('Notification icon pressed');
      //             },
      //           ),
      //           Positioned(
      //             right: 8,
      //             top: 8,
      //             child: Container(
      //               padding: const EdgeInsets.all(2),
      //               decoration: BoxDecoration(
      //                 color: Colors.orange,
      //                 borderRadius: BorderRadius.circular(8),
      //               ),
      //               constraints: const BoxConstraints(
      //                 minWidth: 16,
      //                 minHeight: 16,
      //               ),
      //               child: const Text(
      //                 '2',
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                   fontSize: 10,
      //                 ),
      //                 textAlign: TextAlign.center,
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      appBar: DefaultAppbar(
        backgroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
