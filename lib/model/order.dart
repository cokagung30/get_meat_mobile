part of 'models.dart';

class Order extends Equatable {
  const Order({
    required this.id,
    required this.paymentAmount,
    required this.orderNumber,
    required this.sendDate,
    required this.typePayment,
    this.photoSendProof,
    this.paymentUrl,
    required this.orderStatus,
    this.photoProofPayment,
    required this.orderAddress,
    required this.costSend,
    required this.quantityOrder,
    required this.orderDate,
    required this.product,
    required this.customer,
  });

  final int id;
  final int paymentAmount;
  final String orderNumber;
  final String sendDate;
  final String typePayment;
  final String? photoSendProof;
  final String? paymentUrl;
  final String orderStatus;
  final String? photoProofPayment;
  final String orderAddress;
  final int costSend;
  final int quantityOrder;
  final String orderDate;
  final Product product;
  final User customer;

  Order.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        paymentAmount = json['total_bayar'],
        orderNumber = json['no_pesanan'],
        sendDate = json['tgl_pengiriman'],
        typePayment = json['tipe_pembayaran'],
        photoSendProof = json['photo_penerimaan'] ?? '',
        paymentUrl = json['payment_url'] ?? '',
        orderStatus = json['tipe_pembayaran'],
        photoProofPayment = json['photo_bukti_pembayaran'] ?? '',
        orderAddress = json['alamat_pemesanan'],
        costSend = json['biaya_antar'],
        quantityOrder = json['jml_pemesanan'],
        orderDate = json['tgl_pemesanan'],
        product = Product.fromJson(json['product']),
        customer = User.fromJson(json['customer']);

  @override
  List<Object?> get props => [
        id,
        paymentAmount,
        orderNumber,
        sendDate,
        typePayment,
        photoSendProof,
        paymentUrl,
        orderStatus,
        photoProofPayment,
        orderAddress,
        costSend,
        quantityOrder,
        orderDate,
        product,
        customer,
      ];
}
