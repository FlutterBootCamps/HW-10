import 'package:amc_applicaition/bloc/nav_bloc/navigation_bloc.dart';
import 'package:amc_applicaition/data/data_service.dart';
import 'package:amc_applicaition/models/movie_model.dart';
import 'package:amc_applicaition/service/setup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final serviceLocate = locater.get<DataService>();
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) {
      // TODO: implement event handler
    });

//handle initial event, when the page starting this event will trigger
    on<InitialEvent>((event, emit) async {
      if (state is MovieInitial) {
        emit(MovieLoadingState());
        await serviceLocate.fetchMovies();
        emit(SuccessState(movieList: serviceLocate.movieList));
      }
    });
  }
}
