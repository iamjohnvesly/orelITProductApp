import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ui_design_quotes/theme/base_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DefaultAppbar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;
  final Color? textColor;
  final Color? backgroundColor;
  final List<Widget>? actions;
  DefaultAppbar({
    this.actions,
    this.title,
    Key? key,
    this.backgroundColor,
    this.textColor,
  })  : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  State<DefaultAppbar> createState() => _DefaultAppbarState();
}

class _DefaultAppbarState extends State<DefaultAppbar> {
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

  setCurrentLocation(String currentLocation) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentLocation', currentLocation);
  }

  @override
  void initState() {
    _getCurrentPosition();
    setCurrentLocation(_currentAddress.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: widget.textColor,
      elevation: 0,
      title: widget.title != null
          ? Text(
              widget.title!,
              style: TextStyle(color: widget.textColor),
            )
          : null,
      backgroundColor: widget.backgroundColor,
      centerTitle: true,
      automaticallyImplyLeading: true,
      leadingWidth: 200,
      leading: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(_currentAddress ?? 'City Location..'),
              const Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: appRed,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: appWhite,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
