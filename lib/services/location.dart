import 'package:geocoder/geocoder.dart';
import 'package:location/location.dart';

class LocationByLocation {
  static String pinCode, state, city;
  getLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    Coordinates coordinates =
        Coordinates(_locationData.latitude, _locationData.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    pinCode = addresses.first.postalCode;
    state = addresses.first.adminArea;
    city = addresses.first.subAdminArea;
  }
}
