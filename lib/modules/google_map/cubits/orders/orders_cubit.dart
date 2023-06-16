import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locations_work/core/helpers/marker_helper.dart';
import 'package:locations_work/modules/google_map/models/my_order_model.dart';
import 'package:locations_work/modules/google_map/repository/map_repository.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  MapRepository mapRepository;
  OrdersCubit(this.mapRepository) : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);

  List<Orders>? waiting;
  late BitmapDescriptor icon;
  List<Marker> markers = [];

  Future<void> getOrder(BuildContext? context) async {
    emit(GetOrdersLoading());
    await mapRepository.getOrders().then((result) async {
      result.fold(
            (failure) => emit(GetOrdersError(failure.message)),
            (response) async {
          waiting = response.orders;
          await createMarkerForOrder(waiting!, context!);
          emit(GetOrdersSuccess(response, markers));
        },
      );
    });
  }

  Future<void> createMarkerForOrder(
      List<Orders> orders, BuildContext context) async {
    await for (var order in Stream.fromIterable(orders)) {
      icon = await MarkerHelper.getMarkerIcon(const Size(160, 160), order);
      markers.add(Marker(
        onTap: () {
          _onMarkerTap(order, context);
        },
        markerId: MarkerId(order.orderId.toString()),
        position: LatLng(
            order.lat!, order.long!),
        icon: icon,
      ));
    }
  }
  void _onMarkerTap(Orders order, BuildContext context) {
    switch (order.status) {
      case 'waiting':
        // _showTakeOrderDialog(order, context);
        break;
      case 'assigned':
      case 'missed':
      case 'canceled':
      case 'completed':
        // _navigateToOrderDetails(order, context);
        break;
    }
  }

}
