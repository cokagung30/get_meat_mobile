part of 'models.dart';

class Seller extends Equatable {
  final int id;
  final String sellerName;
  final String rekeningNumber;
  final String whatsappNumber;
  final String phoneNumber;
  final String bankName;
  final String bankAccountName;
  final String sellerAddress;
  final String photoPicSeller;
  final int productCount;
  final Province province;
  final Cities city;

  const Seller({
    required this.id,
    required this.sellerName,
    required this.rekeningNumber,
    required this.whatsappNumber,
    required this.phoneNumber,
    required this.bankName,
    required this.bankAccountName,
    required this.sellerAddress,
    required this.photoPicSeller,
    required this.productCount,
    required this.province,
    required this.city,
  });

  Seller.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        sellerName = json['nama_dagang'],
        rekeningNumber = json['no_rekening'],
        whatsappNumber = json['no_wa'],
        phoneNumber = json['no_telp'],
        bankName = json['nama_bank'],
        bankAccountName = json['nama_rekening'],
        sellerAddress = json['alamat_dagang'],
        photoPicSeller = json['photo_pedagang'] ?? '',
        productCount = json['jumlah_produk'] ?? 0,
        province = Province.fromJson(json['province']),
        city = Cities.fromJson(json['city']);

  @override
  List<Object> get props => [
        id,
        sellerName,
        rekeningNumber,
        whatsappNumber,
        phoneNumber,
        bankName,
        bankAccountName,
        sellerAddress,
        photoPicSeller,
        province,
        city,
        productCount,
      ];
}
