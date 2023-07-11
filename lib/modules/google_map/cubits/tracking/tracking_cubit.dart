import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:locations_work/modules/google_map/models/tracking_model.dart';
import 'package:locations_work/modules/google_map/repository/map_repository.dart';


part 'tracking_state.dart';

class TrackingCubit extends Cubit<TrackingState> {
  MapRepository mapRepository;
  TrackingCubit(this.mapRepository) : super(TrackingInitial());
  static TrackingCubit get(context) => BlocProvider.of(context);
  void getSourceAndDestination() {
    emit(GetSourceAndDestinationLoading());
    mapRepository.getSourceAndDestination().then((result) {
      result.fold((failure) {
        emit(GetSourceAndDestinationError(failure.message));
      }, (response) {
        emit(GetSourceAndDestinationSuccess(response));
      });
    });
  }

}
