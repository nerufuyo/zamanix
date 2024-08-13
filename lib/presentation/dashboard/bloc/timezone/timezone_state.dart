part of 'timezone_bloc.dart';

sealed class TimezoneState extends Equatable {
  const TimezoneState();

  @override
  List<Object> get props => [];
}

final class TimezoneInitial extends TimezoneState {}

final class TimezoneLoading extends TimezoneState {}

final class TimezoneLoaded extends TimezoneState {
  final String time;
  final String date;
  final String country;

  const TimezoneLoaded({
    required this.time,
    required this.date,
    required this.country,
  });

  @override
  List<Object> get props => [time, date];
}

final class TimezoneError extends TimezoneState {
  final String message;

  const TimezoneError({required this.message});

  @override
  List<Object> get props => [message];
}
