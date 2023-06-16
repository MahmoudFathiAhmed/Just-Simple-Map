import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/modules/google_map/cubits/map/map_cubit.dart';
import 'package:locations_work/modules/google_map/cubits/map/map_state.dart';
import 'package:locations_work/modules/google_map/cubits/orders/orders_cubit.dart';

class GoogleMapScreen2 extends StatelessWidget {
  const GoogleMapScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: BlocProvider(
          create: (context) =>
          OrdersCubit(getIt.get())
            ..getOrder(context),
          child: BlocConsumer<OrdersCubit, OrdersState>(
            listener: (context, state) {
              if (state is GetOrdersLoading) {
                loading(context);
              }
            },
            builder: (context, orderState) {
              var cubit = OrdersCubit.get(context);
              if (orderState is GetOrdersLoading) {
                return const CircularProgressIndicator();
              } else if (orderState is GetOrdersSuccess) {
                return BlocProvider(
                  create: (context) => MapCubit(),
                  child: BlocBuilder<MapCubit, MapState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator();
                      } else if (state.error != null) {
                        return Center(
                          child: Text(state.error!),
                        );
                      } else if (state.location != null) {
                        return Stack(
                          children: [
                            GoogleMap(
                              myLocationEnabled: true,
                              zoomControlsEnabled: false,
                              myLocationButtonEnabled: false,
                              markers: Set.of(cubit.markers),
                              initialCameraPosition: CameraPosition(
                                target: LatLng(state.location!.latitude,
                                    state.location!.longitude),
                                zoom: 18,
                              ),
                            ),
                            // const MapDirectionsWidget()
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text('no locations available'),
                        );
                      }
                    },
                  ),
                );
              } else {
                return const Center(child: Text(''));
              }
            },
          ),
        ),
      );
  }
}

Future loading(dialogContext) {
  return showDialog(
    context: dialogContext,
    builder: (context) => const CircularProgressIndicator(),
    barrierDismissible: false,
  );
}
