part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class OrdersInitial extends OrdersState {
  @override
  List<Object> get props => [];
}

class GetOrdersLoading extends OrdersState {
  @override
  List<Object> get props => [];
}

class GetOrdersSuccess extends OrdersState {
  final MyOrderModel orders;
  final List<Marker> markers;

  const GetOrdersSuccess(this.orders, this.markers);

  @override
  List<Object> get props => [Orders, markers];
}

class GetOrdersError extends OrdersState {
  final String error;

  const GetOrdersError(this.error);

  @override
  List<Object> get props => [error];
}
