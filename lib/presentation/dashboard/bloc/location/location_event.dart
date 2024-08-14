part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

final class GetLocation extends LocationEvent {}

final class UpdateLocation extends LocationEvent {
  final String country;
  final String city;

  const UpdateLocation(this.country, this.city);

  @override
  List<Object> get props => [country, city];
}
