import 'package:equatable/equatable.dart';

class UserRequest extends Equatable {
  const UserRequest({
    required this.customerName,
    required this.customerEmail,
    required this.customerPhoneNumber,
    required this.customerWhatsappNumber,
    required this.customerAddress,
  });

  final String customerName;
  final String customerEmail;
  final String customerPhoneNumber;
  final String customerWhatsappNumber;
  final String customerAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'nama_pembeli': customerName,
      'email_pembeli': customerEmail,
      'no_telp': customerPhoneNumber,
      'no_wa': customerWhatsappNumber,
      'alamat_pembeli': customerAddress,
    };
    return map;
  }

  @override
  List<Object?> get props => [
        customerName,
        customerEmail,
        customerPhoneNumber,
        customerWhatsappNumber,
        customerAddress,
      ];
}
