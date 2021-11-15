part of 'models.dart';

class User extends Equatable {
  // Create a constructor for the User class
  const User({
    required this.id,
    required this.customerName,
    required this.customerEmail,
    required this.customerAddress,
    required this.customerWhatsappNumber,
    required this.customerPhoneNumber,
    required this.customerPassword,
    required this.customerProvince,
    required this.customerCity,
    required this.customerProfilePicture,
  });

  final int id;
  final String customerName;
  final String customerEmail;
  final String customerAddress;
  final String customerWhatsappNumber;
  final String customerPhoneNumber;
  final String? customerPassword;
  final int customerProvince;
  final int customerCity;
  final String customerProfilePicture;

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        customerName = json['nama_pembeli'],
        customerEmail = json['email_pembeli'],
        customerAddress = json['alamat_pembeli'],
        customerWhatsappNumber = json['no_wa'],
        customerPhoneNumber = json['no_telp'],
        customerProvince = int.parse(json['provinsi_id'].toString()),
        customerCity = int.parse(json['kota_id'].toString()),
        customerProfilePicture = json['photo_profile'] ?? '',
        customerPassword = '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      "nama_pembeli": customerName,
      "email_pembeli": customerEmail,
      "alamat_pembeli": customerAddress,
      "no_wa": customerWhatsappNumber,
      "no_telp": customerPhoneNumber,
      "password": customerPassword,
      "provinsi": customerProvince,
      "kota": customerCity,
    };
    return map;
  }

  @override
  List<Object> get props => [
        id,
        customerName,
        customerEmail,
        customerAddress,
        customerWhatsappNumber,
        customerPhoneNumber,
        customerProvince,
        customerCity,
        customerProfilePicture,
      ];
}
