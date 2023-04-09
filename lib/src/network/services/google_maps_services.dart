import 'dart:async';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as location;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsService {
  CameraPosition initialPosition =
      const CameraPosition(target: LatLng(10.5118637, -66.963071), zoom: 14);

  LatLng? addressLatLng;

  var address = '';
  Completer<GoogleMapController> googleMapController = Completer();
  Position? position;

  StreamSubscription? positionSub;
  Future setLocationInfo() async {
    double lat = initialPosition.target.latitude;
    double lng = initialPosition.target.longitude;

    List<Placemark> placemark = await placemarkFromCoordinates(lat, lng);
    if (placemark.isNotEmpty) {
      String direction = placemark[0].thoroughfare ?? '';
      String street = placemark[0].subThoroughfare ?? '';
      String city = placemark[0].locality ?? '';
      String department = placemark[0].administrativeArea ?? '';
      String country = placemark[0].country ?? '';
      address = '$direction #$street, $city, $department';
      addressLatLng = LatLng(lat, lng);
    }
  }

  void checkGpsEnabled() async {
    bool isGpsEnabled = await Geolocator.isLocationServiceEnabled();
    if (isGpsEnabled == true) {
      updateLocation();
    } else {
      Future<bool> locationGps = location.Location().requestService();
      // ignore: unrelated_type_equality_checks
      if (locationGps == true) {
        updateLocation();
      }
    }
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR" + error.toString());
    });
    return await Geolocator.getCurrentPosition();
  }

  void centerPosition() {
    animateCameraPosition(position?.latitude ?? 0, position?.longitude ?? 0);
  }

  Future animateCameraPosition(double lat, double lng) async {
    GoogleMapController controller = await googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 14, bearing: 0)));
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void onMapCreate(GoogleMapController controller) {
    if (!googleMapController.isCompleted) {
      print('Error en Google Map ');
    } else {}
  }

  void updateLocation() async {
    try {
      await determinePosition();
      position = await Geolocator.getLastKnownPosition();
      animateCameraPosition(position!.latitude, position!.longitude);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  void onClose() {
    positionSub?.cancel();
  }
}
