import 'package:equatable/equatable.dart';

class OrderRequest extends Equatable {
  const OrderRequest({
    required this.sellerId,
    required this.productId,
    required this.quantity,
    required this.customerId,
    required this.totalPayment,
    required this.sendCost,
    required this.orderAddress,
    required this.paymentType,
  });

  final int sellerId;
  final int productId;
  final int customerId;
  final int totalPayment;
  final int sendCost;
  final int quantity;
  final String orderAddress;
  final String paymentType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      "seller_id": sellerId,
      "product_id": productId,
      "total_payment": totalPayment,
      "customer_id": customerId,
      "send_cost": sendCost,
      "quantity": quantity,
      "order_address": orderAddress,
      "payment_type": paymentType,
    };
    return map;
  }

  @override
  List<Object?> get props => [
        sellerId,
        productId,
        customerId,
        totalPayment,
        sendCost,
        quantity,
        orderAddress,
        paymentType,
      ];
}
