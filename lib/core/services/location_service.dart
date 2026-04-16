import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  // Office location coordinates
  final double officeLat;
  final double officeLong;
  final double allowedRadiusInMeters;

  LocationService({
    required this.officeLat,
    required this.officeLong,
    this.allowedRadiusInMeters = 100.0, // Default 100 meters
  });

  /// Calculate distance between two coordinates in meters
  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    const double earthRadius = 6371000; // Earth's radius in meters

    // Convert latitude and longitude to radians
    final double lat1Rad = lat1 * pi / 180;
    final double lat2Rad = lat2 * pi / 180;
    final double deltaLatRad = (lat2 - lat1) * pi / 180;
    final double deltaLonRad = (lon2 - lon1) * pi / 180;

    // Haversine formula
    final double a = sin(deltaLatRad / 2) * sin(deltaLatRad / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(deltaLonRad / 2) * sin(deltaLonRad / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  /// Check if current location is within office radius
  bool isInOfficeRadius(double currentLat, double currentLong) {
    final distance = calculateDistance(
      currentLat,
      currentLong,
      officeLat,
      officeLong,
    );
    return distance <= allowedRadiusInMeters;
  }

  /// Get distance from current location to office
  double getDistanceToOffice(double currentLat, double currentLong) {
    return calculateDistance(
      currentLat,
      currentLong,
      officeLat,
      officeLong,
    );
  }

  /// Check if location permissions are granted
  Future<bool> checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    
    return true;
  }

  /// Check and request location permissions for both location and background
  Future<LocationPermissionStatus> checkAndRequestPermissions() async {
    // Check location permission
    final locationStatus = await Permission.location.status;
    
    if (!locationStatus.isGranted) {
      final result = await Permission.location.request();
      if (!result.isGranted) {
        return LocationPermissionStatus.denied;
      }
    }

    // For Android, check location when in use permission
    if (locationStatus.isLimited) {
      return LocationPermissionStatus.limited;
    }

    return LocationPermissionStatus.granted;
  }

  /// Get current location
  Future<LocationResult> getCurrentLocation() async {
    try {
      // Check if location service is enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return LocationResult.error('Location services are disabled. Please enable them in settings.');
      }

      // Check permissions
      final hasPermission = await checkLocationPermission();
      if (!hasPermission) {
        return LocationResult.error('Location permissions are denied. Please enable them in settings.');
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      // Get address from coordinates
      String address = 'Unknown location';
      try {
        List<Placemark> placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );
        
        if (placemarks.isNotEmpty) {
          Placemark place = placemarks.first;
          address = _buildAddressString(place);
        }
      } catch (e) {
        address = 'Latitude: ${position.latitude.toStringAsFixed(6)}, Longitude: ${position.longitude.toStringAsFixed(6)}';
      }

      // Calculate distance to office
      final distance = getDistanceToOffice(position.latitude, position.longitude);
      final inRadius = isInOfficeRadius(position.latitude, position.longitude);

      return LocationResult.success(
        latitude: position.latitude,
        longitude: position.longitude,
        address: address,
        distanceToOffice: distance,
        isInOfficeRadius: inRadius,
      );

    } catch (e) {
      return LocationResult.error('Failed to get location: ${e.toString()}');
    }
  }

  /// Build address string from placemark
  String _buildAddressString(Placemark place) {
    List<String> parts = [];
    
    if (place.street != null && place.street!.isNotEmpty) {
      parts.add(place.street!);
    }
    if (place.subLocality != null && place.subLocality!.isNotEmpty) {
      parts.add(place.subLocality!);
    }
    if (place.locality != null && place.locality!.isNotEmpty) {
      parts.add(place.locality!);
    }
    if (place.subAdministrativeArea != null && place.subAdministrativeArea!.isNotEmpty) {
      parts.add(place.subAdministrativeArea!);
    }
    if (place.administrativeArea != null && place.administrativeArea!.isNotEmpty) {
      parts.add(place.administrativeArea!);
    }
    if (place.country != null && place.country!.isNotEmpty) {
      parts.add(place.country!);
    }
    
    return parts.isNotEmpty ? parts.join(', ') : 'Unknown location';
  }

  /// Open location settings
  Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  /// Open app settings for location permissions
  Future<void> openLocationAppSettings() async {
    await Permission.location.request();
  }
}

/// Result class for location operations
class LocationResult {
  final bool isSuccess;
  final double? latitude;
  final double? longitude;
  final String? address;
  final double? distanceToOffice;
  final bool? isInOfficeRadius;
  final String? errorMessage;

  LocationResult.success({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.distanceToOffice,
    required this.isInOfficeRadius,
  }) : isSuccess = true,
       errorMessage = null;

  LocationResult.error(this.errorMessage) : isSuccess = false,
                                              latitude = null,
                                              longitude = null,
                                              address = null,
                                              distanceToOffice = null,
                                              isInOfficeRadius = null;
}

/// Permission status enum
enum LocationPermissionStatus {
  granted,
  denied,
  limited,
  permanentlyDenied,
}
