import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zamanix/utils/location_service.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService _locationService;

  LocationBloc(this._locationService) : super(LocationInitial()) {
    on<GetLocation>(_onFetchLocation);
  }

  void _onFetchLocation(GetLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    try {
      final position = await _locationService.getLocation();
      if (position != null) {
        final locationData = await _locationService.getCityAndCountry(position);
        if (locationData != null) {
          emit(LocationLoaded(
            country: locationData['country'] ?? "Unknown",
            city: locationData['city'] ?? "Unknown",
          ));
        } else {
          emit(
            const LocationError(
              message: "Failed to retrieve location details.",
            ),
          );
        }
      } else {
        emit(
          const LocationError(
            message: "Unable to retrieve location.",
          ),
        );
      }
    } catch (e) {
      emit(LocationError(message: "Error occurred: $e"));
    }
  }
}
