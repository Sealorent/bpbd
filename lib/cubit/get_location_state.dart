part of 'get_location_cubit.dart';

abstract class GetLocationState extends Equatable {
  const GetLocationState();

  @override
  List<Object> get props => [];
}

class GetLocationInitial extends GetLocationState {}

class GetLocationLoading extends GetLocationState {}

class GetLocationSuccess extends GetLocationState {
  final LocationModel data;

  const GetLocationSuccess({required this.data});
}

class GetLocationError extends GetLocationState {
  final String message;

  const GetLocationError({required this.message});
}
