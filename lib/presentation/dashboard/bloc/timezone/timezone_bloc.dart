import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zamanix/utils/app_timezone.dart';

part 'timezone_event.dart';
part 'timezone_state.dart';

class TimezoneBloc extends Bloc<TimezoneEvent, TimezoneState> {
  Timer? _timer;
  final Duration _updateInterval = const Duration(seconds: 60);

  TimezoneBloc() : super(TimezoneInitial()) {
    on<GetTimezone>(_onGetTimezone);
    _startPeriodicUpdate();
  }

  Future<void> _onGetTimezone(
      GetTimezone event, Emitter<TimezoneState> emit) async {
    emit(TimezoneLoading());

    try {
      final String time = AppTimezone.getRealTime(event.country);
      final String date = AppTimezone.getRealDate();
      emit(TimezoneLoaded(time: time, date: date, country: event.country));
    } catch (e) {
      emit(TimezoneError(message: e.toString()));
    }
  }

  void _startPeriodicUpdate() {
    _timer = Timer.periodic(_updateInterval, (timer) {
      if (state is TimezoneLoaded) {
        final currentState = state as TimezoneLoaded;
        add(GetTimezone(country: currentState.country));
      }
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
