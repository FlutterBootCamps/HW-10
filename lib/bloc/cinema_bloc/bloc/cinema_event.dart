part of 'cinema_bloc.dart';

@immutable
sealed class CinemaEvent {}

final class InitialEvent extends CinemaEvent{}