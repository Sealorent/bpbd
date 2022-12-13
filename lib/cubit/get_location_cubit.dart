import 'package:bloc/bloc.dart';
import 'package:bpbd/models/location_model.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'get_location_state.dart';

class GetLocationCubit extends Cubit<GetLocationState> {
  GetLocationCubit() : super(GetLocationInitial());

  getCurrentLocation() async {
    // if (state is GetLocationLoading) return;

    emit(GetLocationLoading());

    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      emit(const GetLocationError(message: 'GPS tidak aktif'));
    }

    // Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.best,
    //   forceAndroidLocationManager: true,
    //   timeLimit: const Duration(seconds: 30),
    // ).then((Position position) {
    //   LocationModel location = LocationModel(
    //       longitude: position.longitude, latitude: position.latitude);
    //   emit(GetLocationSuccess(data: location));
    // }).catchError((e) {
    //   print('geolocation error : $e');

    //   emit(const GetLocationError(message: 'Tidak dapat mengambil lokasi'));
    // });

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (position.longitude.isNaN && position.latitude.isNaN) {
      emit(const GetLocationError(message: 'Tidak dapat mengambil lokasi'));
    } else {
      LocationModel location = LocationModel(
          longitude: position.longitude, latitude: position.latitude);
      emit(GetLocationSuccess(data: location));
    }
  }
}
