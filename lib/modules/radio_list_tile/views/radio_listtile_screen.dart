import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:locations_work/modules/radio/widgets/car_info_dialog.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/bloc/vehicle_bloc.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/bloc/vehicle_event.dart';
import 'package:locations_work/modules/radio_list_tile/bloc/bloc/vehicle_state.dart';
import 'package:locations_work/modules/radio_list_tile/widgets/vehicle_type_widget2.dart';

class RadioListtileScreen extends StatelessWidget {
  const RadioListtileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleBloc(),
      child: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, vehicleState) {
          String groupValue = (vehicleState is VehicleUpdated)
              ? vehicleState.selectedVehicleId
              : '';
          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20.0),
                itemCount: vehicleState.vehiclesIds.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: VehicleTypeWidget2(
                        text: vehicleState.vehiclesTitles[index],
                        imageUrl: vehicleState.vehiclesImages[index],
                        backgroundColor:
                            vehicleState.vehiclesIds[index] == groupValue
                                ? Colors.blue.withOpacity(.1)
                                : Colors.white,
                        price: vehicleState.vehiclesExteriorPrices[index]
                            .toDouble(),
                        radioGroupValue: groupValue,
                        radioValue: vehicleState.vehiclesIds[index],
                        infoFunc: () {
                          Get.bottomSheet(
                            BottomSheet(
                                enableDrag: false,
                                onClosing: () {
                                  Navigator.pop(context);
                                },
                                builder: (context) {
                                  return CarInfoWidget(
                                    description: vehicleState
                                        .vehiclesdescriptions[index],
                                    imageUrl:
                                        vehicleState.vehiclesImages[index],
                                    title: vehicleState.vehiclesTitles[index],
                                  );
                                }),
                            backgroundColor: Colors.white,
                          );
                        },
                        boxShadow: vehicleState.vehiclesIds[index] == groupValue
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
                          context
                              .read<VehicleBloc>()
                              .add(VehicleSelected(value!));
                          // setState(
                          //   () {
                          //     groupValue = value!;
                          //   },
                          // );
                        }),
                  );
                }),
          );
        },
      ),
    );
  }
}
