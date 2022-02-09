import 'package:bpbd/services/geolocator_services.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  // final placeService = PlaceService();

  late final Position currentLocation;

  // late List<PlaceSearch> searchResults;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }
}
