import 'package:amc_applicaition/data/data_service.dart';
import 'package:amc_applicaition/models/cinemas_model.dart';
import 'package:amc_applicaition/service/setup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cinema_event.dart';
part 'cinema_state.dart';

class CinemaBloc extends Bloc<CinemaEvent, CinemaState> {
  final serviceLocate = locater.get<DataService>();

//to fetch movie location
  CinemaBloc() : super(CinemaInitial()) {
    on<InitialEvent>((event, emit) {
      if (state is CinemaInitial) {
        serviceLocate.fetchLocations();
        emit(SuccessState(locationList: serviceLocate.locationList));
      }
    });
  }
}
