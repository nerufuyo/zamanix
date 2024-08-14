part of 'timezone_bloc.dart';

sealed class TimezoneEvent extends Equatable {
  const TimezoneEvent();

  @override
  List<Object> get props => [];
}

final class GetTimezone extends TimezoneEvent {
  final String country;

  const GetTimezone({required this.country});

  @override
  List<Object> get props => [country];
}
