part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}
final class MovieLoadingState extends MovieState {}



final class SuccessState extends MovieState {
  final List<NewMovieModel> movieList;
  SuccessState({required this.movieList});
}


