class MyOrderModel {
  List<Orders>? orders;

  MyOrderModel({this.orders});

  MyOrderModel.fromJson(Map<String, dynamic> json) {
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? orderId;
  int? totalPrice;
  double? lat;
  double? long;
  String? status;
  String? city;
  String? date;
  String? subTitle;

  Orders(
      {this.orderId,
        this.totalPrice,
        this.lat,
        this.long,
        this.status,
        this.city,
        this.date,
        this.subTitle,
      });

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    totalPrice = json['total_price'];
    lat = json['lat'];
    long = json['long'];
    status = json['status'];
    city = json['city'];
    date = json['date'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['total_price'] = totalPrice;
    data['lat'] = lat;
    data['long'] = long;
    data['status'] = status;
    data['city'] = city;
    data['date'] = date;
    data['sub_title'] = subTitle;
    return data;
  }
}
