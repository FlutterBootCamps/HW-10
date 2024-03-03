part of 'cinema_bloc.dart';

@immutable
sealed class CinemaState {}

final class CinemaInitial extends CinemaState {}

final class SuccessState extends CinemaState {
  final List<LocationData> locationList;
  SuccessState({required this.locationList});
}
