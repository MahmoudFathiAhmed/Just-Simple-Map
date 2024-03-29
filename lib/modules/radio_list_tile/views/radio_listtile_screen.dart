import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:locations_work/core/helpers/service_locator.dart';
import 'package:locations_work/modules/radio/widgets/car_info_dialog.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/vehicle_bloc/vehicle_bloc.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/vehicle_bloc/vehicle_event.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/vehicle_bloc/vehicle_state.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/vehicle_selection_bloc/vehicle_selection_bloc.dart';
import 'package:locations_work/modules/radio_list_tile/models/vehicle_response.dart';

import 'package:locations_work/modules/radio_list_tile/widgets/vehicle_type_widget2.dart';
import 'package:shimmer/shimmer.dart';

class RadioListtileScreen extends StatelessWidget {
  const RadioListtileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    List<Vehicle> vehicles = [];
    String groupValue = '';
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                VehicleBloc(getIt.get())..add(GetAllVehiclesEvent()),
          ),
          BlocProvider(create: (context) => VehicleSelectionBloc())
        ],
        child: BlocBuilder<VehicleBloc, VehicleState>(
          builder: (context, vehicleState) {
            if (vehicleState is GetAllVehilcesSuccessState) {
              vehicles = vehicleState.vehicleResponse.vehicle!;
              return RefreshIndicator(
                onRefresh: () async {
                  await Future.delayed(const Duration(seconds: 1), () {
                    context.read<VehicleBloc>().add(GetAllVehiclesEvent());
                    context.read<VehicleSelectionBloc>().add(VehicleClearSelectionEvent());
                    groupValue = '';
                  });
                },
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 15),
                    itemCount: vehicles.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: BlocBuilder<VehicleSelectionBloc,
                            VehicleSelectionState>(
                          builder: (context, vehicleSelectionState) {
                            if (vehicleSelectionState
                                is VehicleSelectionUpdated) {
                              groupValue =
                                  vehicleSelectionState.selectedVehicleId;
                            }
                            return VehicleTypeWidget2(
                                text: vehicles[index].title!,
                                imageUrl: vehicles[index].image!,
                                backgroundColor:
                                    vehicles[index].id == groupValue
                                        ? Colors.blue.withOpacity(.1)
                                        : Colors.white,
                                price:
                                    vehicles[index].exteriorPrice!.toDouble(),
                                radioGroupValue: groupValue,
                                radioValue: vehicles[index].id!,
                                infoFunc: () {
                                  Get.bottomSheet(
                                    BottomSheet(
                                        enableDrag: false,
                                        onClosing: () {
                                          Navigator.pop(context);
                                        },
                                        builder: (context) {
                                          return CarInfoWidget(
                                            description:
                                                vehicles[index].description!,
                                            imageUrl: vehicles[index].image!,
                                            title: vehicles[index].title!,
                                          );
                                        }),
                                    backgroundColor: Colors.white,
                                  );
                                },
                                boxShadow: vehicles[index].id == groupValue
                                    ? []
                                    : [
                                        const BoxShadow(
                                          offset: Offset(0, 0),
                                          blurStyle: BlurStyle.outer,
                                          blurRadius: 2,
                                          color: Color(0x1A00074B),
                                        )
                                      ],
                                onChanged: (value) {
                                  groupValue = value!;
                                  context
                                      .read<VehicleSelectionBloc>()
                                      .add(VehicleSelected(groupValue));
                                });
                          },
                        ),
                      );
                    }),
              );
            } else if (vehicleState is GetAllVehilcesLoadingState) {
              return const ShimmerLoadingVehicleScreen();
              // return const Center(child: CircularProgressIndicator());
            } else if (vehicleState is GetAllVehilcesErrorState) {
              return Center(child: Text(vehicleState.error));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class ShimmerLoadingVehicleScreen extends StatelessWidget {
  const ShimmerLoadingVehicleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: VehicleTypeWidget2(
                  text: 'text',
                  price: 12.2,
                  radioValue: 'radioValue',
                  radioGroupValue: 'radioGroupValue',
                  onChanged: (_) {},
                  backgroundColor: Colors.black,
                  imageUrl:
                      'https://pics.freeicons.io/uploads/icons/png/11708348221666851072-512.png'),
            ),
          ),
        ),
      ),
    );
  }
}
