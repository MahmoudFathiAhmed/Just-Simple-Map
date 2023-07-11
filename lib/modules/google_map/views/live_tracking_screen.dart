import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/modules/google_map/cubits/tracking/tracking_cubit.dart';

class LiveTrackingScreen extends StatelessWidget {
  const LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TrackingCubit(getIt.get())..getSourceAndDestination(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<TrackingCubit, TrackingState>(
          builder: (trackingContext, trackingState) {
            if (trackingState is GetSourceAndDestinationLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (trackingState is GetSourceAndDestinationSuccess) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                      'source:\nlat=>${trackingState.trackingModel.source!.latitude}\n,\nlong=>${trackingState.trackingModel.source!.longitude}\ndestination:\nlat=>${trackingState.trackingModel.destination!.latitude}\n,\nlong=>${trackingState.trackingModel.destination!.longitude}'),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
