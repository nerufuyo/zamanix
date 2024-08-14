import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer';

class AppLocationService {
  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return false;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return false;
    }

    return permission != LocationPermission.deniedForever;
  }

  Future<Position?> getLocation() async {
    if (!await _handleLocationPermission()) return null;

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return position;
    } catch (e) {
      log('LOCATION ERROR: $e');
      return null;
    }
  }

  Future<Map<String, String>?> getCityAndCountry(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        String country = place.country ?? "Unknown";
        String city = place.locality ?? "Unknown";

        return {
          'country': country,
          'city': city,
        };
      } else {
        log('REVERSE GEOCODING: No placemarks found for coordinates (${position.latitude}, ${position.longitude})');
      }
    } catch (e) {
      log('REVERSE GEOCODING ERROR: $e');
    }
    return null;
  }
}
